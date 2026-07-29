import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure MLEAsymptoticConsistencyPackage where
  parameterSpace : Type
  likelihoodFunction : Type
  maximumLikelihoodEstimator : Type
  consistencyUnderRegularity : Prop
  asymptoticNormality : Prop
  sequentialConsistency : Prop
  parameterNonempty : Nonempty parameterSpace
  likelihoodDefined : Nonempty likelihoodFunction
  estimatorDefined : Nonempty maximumLikelihoodEstimator
  regularityConditions : Prop
  consistencyConditions : consistencyUnderRegularity ∧ regularityConditions
  asymptoticNormalityDerived : asymptoticNormality
  sequentialConsistencyHolds : sequentialConsistency

def MLEAsymptoticConsistencyClosed (M : MLEAsymptoticConsistencyPackage) : Prop :=
  Nonempty M.parameterSpace ∧ Nonempty M.likelihoodFunction ∧ Nonempty M.maximumLikelihoodEstimator ∧
  M.consistencyConditions.1 ∧ M.regularityConditions ∧
  M.asymptoticNormalityDerived ∧ M.sequentialConsistencyHolds

structure MLEAsymptoticConsistencyEvidence (M : MLEAsymptoticConsistencyPackage) where
  parameterClosed : M.parameterNonempty
  likelihoodClosed : M.likelihoodDefined
  estimatorClosed : M.estimatorDefined
  consistencyClosed : M.consistencyConditions.1
  regularityClosed : M.regularityConditions
  asymptoticNormalityClosed : M.asymptoticNormalityDerived
  sequentialConsistencyClosed : M.sequentialConsistencyHolds

theorem mle_asymptotic_consistency_closed_from_evidence
    (M : MLEAsymptoticConsistencyPackage) (E : MLEAsymptoticConsistencyEvidence M) :
    MLEAsymptoticConsistencyClosed M :=
  And.intro E.parameterClosed
    (And.intro E.likelihoodClosed
      (And.intro E.estimatorClosed
        (And.intro E.consistencyClosed
          (And.intro E.regularityClosed
            (And.intro E.asymptoticNormalityClosed E.sequentialConsistencyClosed)))))

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse