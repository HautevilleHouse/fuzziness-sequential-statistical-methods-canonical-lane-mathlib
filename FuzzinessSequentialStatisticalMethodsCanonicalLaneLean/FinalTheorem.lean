import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.BridgeLemmas
import canonicalLaneMathlib.GateLemmas

namespace HautevilleHouse
namespace FuzzinessSequentialStatisticalMethodsCanonicalLaneLean

def ConstrainedFSSMClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fssm_endgame (A : AdmissibleClass) :
    ConstrainedFSSMClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FuzzinessSequentialStatisticalMethodsCanonicalLaneLean
end HautevilleHouse