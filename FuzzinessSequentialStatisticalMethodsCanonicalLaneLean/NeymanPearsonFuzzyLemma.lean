import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure NeymanPearsonFuzzyLemmaPackage where
  hypothesisPair : Prop
  fuzzyTestClass : Type u
  mostPowerfulFuzzyTest : Prop
  criticalRegion : Type v
  optimalThreshold : Prop
  lemmaConclusion : Prop
  mostPowerfulFuzzyTestEvidence : mostPowerfulFuzzyTest
  optimalThresholdEvidence : optimalThreshold
  lemmaConclusionEvidence : lemmaConclusion

structure NeymanPearsonFuzzyLemmaEvidence (N : NeymanPearsonFuzzyLemmaPackage) where
  mostPowerfulFuzzyTestClosed : N.mostPowerfulFuzzyTest
  optimalThresholdClosed : N.optimalThreshold
  lemmaConclusionClosed : N.lemmaConclusion

def NeymanPearsonFuzzyLemmaClosed (N : NeymanPearsonFuzzyLemmaPackage) : Prop :=
  N.mostPowerfulFuzzyTest ∧ N.optimalThreshold ∧ N.lemmaConclusion

theorem neyman_pearson_fuzzy_lemma_closed_from_evidence
    (N : NeymanPearsonFuzzyLemmaPackage) (E : NeymanPearsonFuzzyLemmaEvidence N) :
    NeymanPearsonFuzzyLemmaClosed N := by
  exact And.intro E.mostPowerfulFuzzyTestClosed
    (And.intro E.optimalThresholdClosed E.lemmaConclusionClosed)

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse