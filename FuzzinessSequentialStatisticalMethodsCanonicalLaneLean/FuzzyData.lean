import FuzzinessSequentialStatisticalMethodsCanonicalLaneLean.SequentialAnalysis

/-!
# Fuzzy Data Package
-/

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure FuzzyDataPackage {E : ExponentialFamilyPackage} {S : SufficiencyPackage E}
    {N : NeymanPearsonPackage E S} {M : MLEConsistencyPackage E S N}
    {Q : SequentialAnalysisPackage E S N M} where
  fuzzySample : Type u
  membershipFunction : fuzzySample → (E.sampleSpace → ℝ)
  fuzzifiedStatistic : fuzzySample → E.parameterSpace
  defuzzification : (fuzzySample → E.parameterSpace) → Prop
  robustness : Prop

structure FuzzyDataEvidence {E : ExponentialFamilyPackage} {S : SufficiencyPackage E}
    {N : NeymanPearsonPackage E S} {M : MLEConsistencyPackage E S N}
    {Q : SequentialAnalysisPackage E S N M} (F : FuzzyDataPackage E S N M Q) where
  defuzzificationClosed : F.defuzzification
  robustnessClosed : F.robustness

def FuzzyDataClosed {E : ExponentialFamilyPackage} {S : SufficiencyPackage E}
    {N : NeymanPearsonPackage E S} {M : MLEConsistencyPackage E S N}
    {Q : SequentialAnalysisPackage E S N M} (F : FuzzyDataPackage E S N M Q) : Prop :=
  F.defuzzification ∧ F.robustness

theorem fuzzy_data_closed_from_evidence {E : ExponentialFamilyPackage} {S : SufficiencyPackage E}
    {N : NeymanPearsonPackage E S} {M : MLEConsistencyPackage E S N}
    {Q : SequentialAnalysisPackage E S N M} (F : FuzzyDataPackage E S N M Q)
    (ev : FuzzyDataEvidence F) : FuzzyDataClosed F := by
  exact And.intro ev.defuzzificationClosed ev.robustnessClosed

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse
