import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure FuzzySequentialDecisionPackage where
  fuzzySet : Type
  membershipFunction : Type
  sequentialDecisionRule : Prop
  alphaCut : ℝ
  decisionBoundary : Prop
  riskFunction : Type
  fuzzySetDefined : Nonempty fuzzySet
  membershipFunctionDefined : Nonempty membershipFunction
  decisionRuleSequential : sequentialDecisionRule
  alphaCutInUnitInterval : 0 ≤ alphaCut ∧ alphaCut ≤ 1
  boundaryComputed : decisionBoundary
  riskFunctionDefined : Nonempty riskFunction

def FuzzySequentialDecisionClosed (F : FuzzySequentialDecisionPackage) : Prop :=
  Nonempty F.fuzzySet ∧ Nonempty F.membershipFunction ∧ F.decisionRuleSequential ∧
  F.alphaCutInUnitInterval ∧ F.boundaryComputed ∧ Nonempty F.riskFunction

structure FuzzySequentialDecisionEvidence (F : FuzzySequentialDecisionPackage) where
  fuzzySetClosed : F.fuzzySetDefined
  membershipClosed : F.membershipFunctionDefined
  decisionClosed : F.decisionRuleSequential
  alphaCutClosed : F.alphaCutInUnitInterval
  boundaryClosed : F.boundaryComputed
  riskClosed : F.riskFunctionDefined

theorem fuzzy_sequential_decision_closed_from_evidence
    (F : FuzzySequentialDecisionPackage) (E : FuzzySequentialDecisionEvidence F) :
    FuzzySequentialDecisionClosed F :=
  And.intro E.fuzzySetClosed
    (And.intro E.membershipClosed
      (And.intro E.decisionClosed
        (And.intro E.alphaCutClosed
          (And.intro E.boundaryClosed E.riskClosed))))

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse