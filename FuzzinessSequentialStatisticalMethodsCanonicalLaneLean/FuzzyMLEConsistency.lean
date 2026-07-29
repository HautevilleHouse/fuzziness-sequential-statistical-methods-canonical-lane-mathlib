import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure FuzzyMLEConsistencyPackage where
  sampleSpace : Type u
  fuzzyParameterSpace : Type v
  logLikelihood : Type w
  identifiabilityCondition : Prop
  compactnessCondition : Prop
  continuityCondition : Prop
  consistencyConclusion : Prop
  identifiabilityEvidence : identifiabilityCondition
  compactnessEvidence : compactnessCondition
  continuityEvidence : continuityCondition
  consistencyConclusionEvidence : consistencyConclusion

structure FuzzyMLEConsistencyEvidence (M : FuzzyMLEConsistencyPackage) where
  identifiabilityClosed : M.identifiabilityCondition
  compactnessClosed : M.compactnessCondition
  continuityClosed : M.continuityCondition
  consistencyConclusionClosed : M.consistencyConclusion

def FuzzyMLEConsistencyClosed (M : FuzzyMLEConsistencyPackage) : Prop :=
  M.identifiabilityCondition ∧ M.compactnessCondition ∧
  M.continuityCondition ∧ M.consistencyConclusion

theorem fuzzy_mle_consistency_closed_from_evidence
    (M : FuzzyMLEConsistencyPackage) (E : FuzzyMLEConsistencyEvidence M) :
    FuzzyMLEConsistencyClosed M := by
  exact And.intro E.identifiabilityClosed
    (And.intro E.compactnessClosed
      (And.intro E.continuityClosed E.consistencyConclusionClosed))

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse