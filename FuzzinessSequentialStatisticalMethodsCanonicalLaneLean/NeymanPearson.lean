import FuzzinessSequentialStatisticalMethodsCanonicalLaneLean.Sufficiency

/-!
# Neyman-Pearson Lemma Package
-/

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure NeymanPearsonPackage {E : ExponentialFamilyPackage} {S : SufficiencyPackage E} where
  hypothesis : (E.parameterSpace → Prop) × (E.parameterSpace → Prop)
  testFunction : E.sampleSpace → ℝ
  size : ℝ
  power : ℝ
  mostPowerful : Prop
  likelihoodRatioExists : Prop

structure NeymanPearsonEvidence {E : ExponentialFamilyPackage} {S : SufficiencyPackage E}
    (N : NeymanPearsonPackage E S) where
  mostPowerfulClosed : N.mostPowerful
  likelihoodRatioExistsClosed : N.likelihoodRatioExists

def NeymanPearsonClosed {E : ExponentialFamilyPackage} {S : SufficiencyPackage E}
    (N : NeymanPearsonPackage E S) : Prop :=
  N.mostPowerful ∧ N.likelihoodRatioExists

theorem neyman_pearson_closed_from_evidence {E : ExponentialFamilyPackage} {S : SufficiencyPackage E}
    (N : NeymanPearsonPackage E S) (ev : NeymanPearsonEvidence N) : NeymanPearsonClosed N := by
  exact And.intro ev.mostPowerfulClosed ev.likelihoodRatioExistsClosed

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse
