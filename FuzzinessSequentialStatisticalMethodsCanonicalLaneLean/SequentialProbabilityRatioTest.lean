import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure SPRTPackage where
  hypotheses : Prop
  likelihoodRatio : Type
  upperBound : ℝ
  lowerBound : ℝ
  stoppingRule : Prop
  decisionRule : Prop
  averageSampleSize : Prop
  operatingCharacteristic : Prop
  hypothesesSpecified : hypotheses
  likelihoodRatioDefined : Nonempty likelihoodRatio
  boundsPositive : 0 < lowerBound ∧ lowerBound < upperBound
  stoppingRuleDefined : stoppingRule
  decisionRuleDefined : decisionRule
  averageSampleNumberComputed : averageSampleSize
  operatingCharacteristicComputed : operatingCharacteristic

def SPRTClosed (S : SPRTPackage) : Prop :=
  S.hypothesesSpecified ∧ Nonempty S.likelihoodRatio ∧ S.boundsPositive ∧
  S.stoppingRuleDefined ∧ S.decisionRuleDefined ∧ S.averageSampleSize ∧
  S.operatingCharacteristicComputed

structure SPRTEvidence (S : SPRTPackage) where
  hypothesesClosed : S.hypothesesSpecified
  likelihoodRatioClosed : S.likelihoodRatioDefined
  boundsClosed : S.boundsPositive
  stoppingRuleClosed : S.stoppingRuleDefined
  decisionRuleClosed : S.decisionRuleDefined
  averageSampleSizeClosed : S.averageSampleSize
  operatingCharacteristicClosed : S.operatingCharacteristicComputed

theorem sprt_closed_from_evidence (S : SPRTPackage) (E : SPRTEvidence S) : SPRTClosed S :=
  And.intro E.hypothesesClosed
    (And.intro E.likelihoodRatioClosed
      (And.intro E.boundsClosed
        (And.intro E.stoppingRuleClosed
          (And.intro E.decisionRuleClosed
            (And.intro E.averageSampleSizeClosed E.operatingCharacteristicClosed)))))

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse