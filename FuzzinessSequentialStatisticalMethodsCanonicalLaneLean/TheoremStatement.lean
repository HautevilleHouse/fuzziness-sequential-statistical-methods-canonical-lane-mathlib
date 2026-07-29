import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

structure FuzzinessAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  closedManifold : Prop
  simplyConnected : Prop
  sphereModel : Type
  sphereTopology : TopologicalSpace sphereModel
  homeomorphicToSphere : Prop
  conclusion : homeomorphicToSphere

def FuzzinessWitnessClosed (O : FuzzinessAdmittedObject) : Prop :=
  O.homeomorphicToSphere

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse