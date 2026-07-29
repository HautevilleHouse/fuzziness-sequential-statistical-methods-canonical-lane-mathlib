import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure SequentialLikelihoodRatioPackage where
  observationSequence : Type u
  hypothesis0 : Prop
  hypothesis1 : Prop
  likelihoodRatio : Type v
  sequentialBound : Prop
  errorProbability : Prop
  sequentialBoundEvidence : sequentialBound
  errorProbabilityEvidence : errorProbability

structure SequentialLikelihoodRatioEvidence (S : SequentialLikelihoodRatioPackage) where
  sequentialBoundClosed : S.sequentialBound
  errorProbabilityClosed : S.errorProbability

def SequentialLikelihoodRatioClosed (S : SequentialLikelihoodRatioPackage) : Prop :=
  S.sequentialBound ∧ S.errorProbability

theorem sequential_likelihood_ratio_closed_from_evidence
    (S : SequentialLikelihoodRatioPackage) (E : SequentialLikelihoodRatioEvidence S) :
    SequentialLikelihoodRatioClosed S := by
  exact And.intro E.sequentialBoundClosed E.errorProbabilityClosed

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse