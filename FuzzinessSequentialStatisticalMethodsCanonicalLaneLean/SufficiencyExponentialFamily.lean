import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure SufficiencyPackage (A : AdmissibleClass) where
  statistic : Type u
  sufficientCondition : Prop
  factorizationCriterion : Prop
  minimalSufficiency : Prop
  completeness : Prop

structure SufficiencyEvidence {A : AdmissibleClass} (S : SufficiencyPackage A) where
  sufficientConditionClosed : S.sufficientCondition
  factorizationCriterionClosed : S.factorizationCriterion
  minimalSufficiencyClosed : S.minimalSufficiency
  completenessClosed : S.completeness

def SufficiencyClosed {A : AdmissibleClass} (S : SufficiencyPackage A) : Prop :=
  S.sufficientCondition ∧ S.factorizationCriterion ∧ S.minimalSufficiency ∧ S.completeness

theorem sufficiency_closed_from_evidence {A : AdmissibleClass} (S : SufficiencyPackage A) (E : SufficiencyEvidence S) : SufficiencyClosed S :=
  And.intro E.sufficientConditionClosed (And.intro E.factorizationCriterionClosed (And.intro E.minimalSufficiencyClosed E.completenessClosed))

structure ExponentialFamilyPackage (A : AdmissibleClass) where
  parameterSpace : Type u
  naturalParameter : Type v
  sufficientStatistic : Type w
  logNormalizer : Type x
  exponentialForm : Prop
  regularityConditions : Prop

structure ExponentialFamilyEvidence {A : AdmissibleClass} (E : ExponentialFamilyPackage A) where
  exponentialFormClosed : E.exponentialForm
  regularityConditionsClosed : E.regularityConditions

def ExponentialFamilyClosed {A : AdmissibleClass} (E : ExponentialFamilyPackage A) : Prop :=
  E.exponentialForm ∧ E.regularityConditions

theorem exponential_family_closed_from_evidence {A : AdmissibleClass} (E : ExponentialFamilyPackage A) (Ev : ExponentialFamilyEvidence E) : ExponentialFamilyClosed E :=
  And.intro Ev.exponentialFormClosed Ev.regularityConditionsClosed

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse