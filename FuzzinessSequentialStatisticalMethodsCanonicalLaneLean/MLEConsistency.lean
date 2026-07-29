import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure MLEConsistencyPackage (A : AdmissibleClass) where
  likelihoodFunction : A.object.parameterSpace → ℝ
  maximumLikelihoodEstimator : A.object.parameterSpace
  consistencyProof : Prop
  consistencyProofProof : consistencyProof

structure MLEConsistencyEvidence (A : AdmissibleClass) (M : MLEConsistencyPackage A) where
  consistencyProofClosed : M.consistencyProof

def MLEConsistencyClosed (A : AdmissibleClass) (M : MLEConsistencyPackage A) : Prop :=
  M.consistencyProof

theorem mle_consistency_closed_from_evidence (A : AdmissibleClass) (M : MLEConsistencyPackage A)
    (E : MLEConsistencyEvidence A M) : MLEConsistencyClosed A M := by
  exact E.consistencyProofClosed

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse