import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure TestStatisticDistribution where
  sampleSize : ℕ
  testStatistic : Type
  nullDistribution : Prop
  alphaLevel : ℝ
  isSequential : Prop
  criticalValues : Prop
  distributionDerived : Prop
  sampleSizeDefined : sampleSize = 0 ∨ sampleSize > 0
  testStatisticType : Nonempty testStatistic
  nullDistributionProvided : nullDistribution
  alphaLevelInUnitInterval : 0 ≤ alphaLevel ∧ alphaLevel ≤ 1
  isSequentialDetermined : isSequential
  criticalValuesComputed : criticalValues
  distributionDerivedFromData : distributionDerived

structure TestStatisticDistributionEvidence (T : TestStatisticDistribution) where
  sampleSizeCondition : T.sampleSizeDefined
  testStatisticNonempty : T.testStatisticType
  nullDistributionClosed : T.nullDistributionProvided
  alphaLevelValid : T.alphaLevelInUnitInterval
  sequentialFlagClosed : T.isSequentialDetermined
  criticalValuesClosed : T.criticalValuesComputed
  distributionDerivedClosed : T.distributionDerivedFromData

def TestStatisticDistributionClosed (T : TestStatisticDistribution) : Prop :=
  T.sampleSizeDefined ∧ Nonempty T.testStatistic ∧ T.nullDistributionProvided ∧
  T.alphaLevelInUnitInterval ∧ T.isSequentialDetermined ∧ T.criticalValuesComputed ∧
  T.distributionDerivedFromData

theorem test_statistic_distribution_closed_from_evidence (T : TestStatisticDistribution)
    (E : TestStatisticDistributionEvidence T) : TestStatisticDistributionClosed T :=
  And.intro E.sampleSizeCondition
    (And.intro E.testStatisticNonempty
      (And.intro E.nullDistributionClosed
        (And.intro E.alphaLevelValid
          (And.intro E.sequentialFlagClosed
            (And.intro E.criticalValuesClosed E.distributionDerivedClosed)))))

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse