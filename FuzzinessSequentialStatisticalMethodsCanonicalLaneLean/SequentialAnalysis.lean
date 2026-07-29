import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure SequentialTestStructure where
  stoppingTime : Type u
  decisionRule : stoppingTime → ℕ
  boundaryA : ℝ
  boundaryB : ℝ
  typeIError : ℝ
  typeIIError : ℝ
  averageSampleNumber : ℝ
  waldsEquation : Prop
  optimalStoppingCondition : Prop

structure SequentialEstimationStructure where
  stoppingRule : Type u
  estimator : stoppingRule → ℝ
  bias : ℝ
  variance : ℝ
  consistencyCondition : Prop
  asymptoticEfficiencyCondition : Prop

structure SequentialTestEvidence (S : SequentialTestStructure) where
  waldsEquationClosed : S.waldsEquation
  optimalStoppingConditionClosed : S.optimalStoppingCondition
  typeIErrorBound : S.typeIError ≤ 0.05
  typeIIErrorBound : S.typeIIError ≤ 0.05

structure SequentialEstimationEvidence (E : SequentialEstimationStructure) where
  consistencyConditionClosed : E.consistencyCondition
  asymptoticEfficiencyConditionClosed : E.asymptoticEfficiencyCondition

def SequentialTestClosed (S : SequentialTestStructure) : Prop :=
  S.waldsEquation ∧ S.optimalStoppingCondition ∧ S.typeIError ≤ 0.05 ∧ S.typeIIError ≤ 0.05

def SequentialEstimationClosed (E : SequentialEstimationStructure) : Prop :=
  E.consistencyCondition ∧ E.asymptoticEfficiencyCondition

theorem sequential_test_closed_from_evidence (S : SequentialTestStructure) (Ev : SequentialTestEvidence S) :
    SequentialTestClosed S := by
  exact And.intro (And.intro Ev.waldsEquationClosed Ev.optimalStoppingConditionClosed)
    (And.intro Ev.typeIErrorBound Ev.typeIIErrorBound)

theorem sequential_estimation_closed_from_evidence (E : SequentialEstimationStructure) (Ev : SequentialEstimationEvidence E) :
    SequentialEstimationClosed E := by
  exact And.intro Ev.consistencyConditionClosed Ev.asymptoticEfficiencyConditionClosed

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse