import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure SufficiencyStructure where
  dataSpace : Type u
  parameterSpace : Type v
  likelihood : dataSpace → parameterSpace → ℝ
  sufficientStatistic : dataSpace → Type w
  factorizationCondition : Prop

structure ExponentialFamilyStructure where
  naturalParameter : Type u
  sufficientStatistic : dataSpace → naturalParameter
  logNormalizer : naturalParameter → ℝ
  baseMeasure : dataSpace → ℝ
  exponentialFormCondition : Prop

structure SufficiencyEvidence (S : SufficiencyStructure) where
  factorizationConditionClosed : S.factorizationCondition
  exponentialFamilyExtracted : ExponentialFamilyStructure
  exponentialFormConditionClosed : exponentialFamilyExtracted.exponentialFormCondition

structure ExponentialFamilyEvidence (E : ExponentialFamilyStructure) where
  exponentialFormConditionClosed : E.exponentialFormCondition

def SufficiencyClosed (S : SufficiencyStructure) : Prop :=
  S.factorizationCondition

def ExponentialFamilyClosed (E : ExponentialFamilyStructure) : Prop :=
  E.exponentialFormCondition

theorem sufficiency_closed_from_evidence (S : SufficiencyStructure) (E : SufficiencyEvidence S) :
    SufficiencyClosed S := by
  exact E.factorizationConditionClosed

theorem exponential_family_closed_from_evidence (E : ExponentialFamilyStructure) (Ev : ExponentialFamilyEvidence E) :
    ExponentialFamilyClosed E := by
  exact Ev.exponentialFormConditionClosed

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse