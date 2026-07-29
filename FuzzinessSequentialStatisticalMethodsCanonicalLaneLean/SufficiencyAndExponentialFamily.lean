import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure SufficiencyPackage where
  statistic : Type
  sufficientStatistic : Prop
  factorizationTheorem : Prop
  minimalSufficiency : Prop
  completeness : Prop
  statisticType : Nonempty statistic
  sufficientStatisticCondition : sufficientStatistic
  factorizationTheoremProof : factorizationTheorem
  minimalSufficiencyEstablished : minimalSufficiency
  completenessCondition : completeness

def SufficiencyClosed (S : SufficiencyPackage) : Prop :=
  Nonempty S.statistic ∧ S.sufficientStatisticCondition ∧ S.factorizationTheoremProof ∧
  S.minimalSufficiencyEstablished ∧ S.completenessCondition

structure ExponentialFamilyPackage (S : SufficiencyPackage) where
  canonicalParameter : Type
  naturalParameterSpace : Prop
  logPartition : Type
  carrierMeasure : Prop
  exponentialForm : Prop
  sequentialUpdate : Prop
  parameterNonempty : Nonempty canonicalParameter
  parameterSpaceOpen : naturalParameterSpace
  partitionDefined : logPartition
  carrierMeasureFixed : carrierMeasure
  densityExponentialForm : exponentialForm
  sequentialUpdateRule : sequentialUpdate

def ExponentialFamilyClosed {S : SufficiencyPackage} (E : ExponentialFamilyPackage S) : Prop :=
  Nonempty E.canonicalParameter ∧ E.naturalParameterSpace ∧ Nonempty E.logPartition ∧
  E.carrierMeasureFixed ∧ E.densityExponentialForm ∧ E.sequentialUpdateRule

structure SufficiencyExponentialEvidence {S : SufficiencyPackage} (E : ExponentialFamilyPackage S) where
  sufficiencyClosed : SufficiencyClosed S
  exponentialFamilyClosed : ExponentialFamilyClosed E

theorem sufficiency_exponential_closed_from_evidence {S : SufficiencyPackage}
    (E : ExponentialFamilyPackage S) (Ev : SufficiencyExponentialEvidence E) :
    SufficiencyClosed S ∧ ExponentialFamilyClosed E :=
  And.intro Ev.sufficiencyClosed Ev.exponentialFamilyClosed

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse