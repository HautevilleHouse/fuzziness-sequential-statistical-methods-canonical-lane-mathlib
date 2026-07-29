import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure FSSMAdmittedObject where
  sampleSpace : Type
  sigmaAlgebra : Set (Set sampleSpace)
  probabilityMeasure : (Set sampleSpace) → ℝ
  parameterSpace : Type
  decisionRule : (Set sampleSpace) → (parameterSpace → ℝ)
  conclusion : Prop

definition FSSMWitnessClosed (O : FSSMAdmittedObject) : Prop :=
  O.conclusion

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse