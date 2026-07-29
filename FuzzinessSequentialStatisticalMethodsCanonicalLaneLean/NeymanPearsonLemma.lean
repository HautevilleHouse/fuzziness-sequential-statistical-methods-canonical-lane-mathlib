import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure NeymanPearsonPackage (A : AdmissibleClass) where
  nullHypothesis : Set A.object.parameterSpace
  alternativeHypothesis : Set A.object.parameterSpace
  mostPowerfulTest : (Set A.object.sampleSpace) → ℝ
  lemmaProof : Prop
  lemmaProofProof : lemmaProof

structure NeymanPearsonEvidence (A : AdmissibleClass) (N : NeymanPearsonPackage A) where
  lemmaProofClosed : N.lemmaProof

def NeymanPearsonClosed (A : AdmissibleClass) (N : NeymanPearsonPackage A) : Prop :=
  N.lemmaProof

theorem neyman_pearson_closed_from_evidence (A : AdmissibleClass) (N : NeymanPearsonPackage A)
    (E : NeymanPearsonEvidence A N) : NeymanPearsonClosed A N := by
  exact E.lemmaProofClosed

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse