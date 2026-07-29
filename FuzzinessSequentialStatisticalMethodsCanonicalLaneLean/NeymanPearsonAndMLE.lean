import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure NeymanPearsonLemma where
  hypothesis : Prop
  alternative : Prop
  testFunction : Type u → ℝ
  mostPowerfulTest : Prop
  threshold : ℝ
  significanceLevel : ℝ
  power : ℝ
  neymanPearsonCondition : Prop

structure MLEStructure where
  parameterSpace : Type u
  likelihoodFunction : dataSpace → parameterSpace → ℝ
  logLikelihoodFunction : dataSpace → parameterSpace → ℝ
  scoreFunction : parameterSpace → ℝ
  fisherInformation : parameterSpace → ℝ
  mleEstimate : parameterSpace
  consistencyCondition : Prop
  asymptoticNormalityCondition : Prop

structure NeymanPearsonEvidence (N : NeymanPearsonLemma) where
  neymanPearsonConditionClosed : N.neymanPearsonCondition
  mostPowerfulTestClosed : N.mostPowerfulTest

structure MLEEvidence (M : MLEStructure) where
  consistencyConditionClosed : M.consistencyCondition
  asymptoticNormalityConditionClosed : M.asymptoticNormalityCondition

def NeymanPearsonClosed (N : NeymanPearsonLemma) : Prop :=
  N.neymanPearsonCondition ∧ N.mostPowerfulTest

def MLEClosed (M : MLEStructure) : Prop :=
  M.consistencyCondition ∧ M.asymptoticNormalityCondition

theorem neyman_pearson_closed_from_evidence (N : NeymanPearsonLemma) (E : NeymanPearsonEvidence N) :
    NeymanPearsonClosed N := by
  exact And.intro E.neymanPearsonConditionClosed E.mostPowerfulTestClosed

theorem mle_closed_from_evidence (M : MLEStructure) (E : MLEEvidence M) :
    MLEClosed M := by
  exact And.intro E.consistencyConditionClosed E.asymptoticNormalityConditionClosed

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse