import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FSSMWitnessClosed (A.object)

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse