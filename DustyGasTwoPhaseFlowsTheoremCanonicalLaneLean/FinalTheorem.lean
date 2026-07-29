import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

def DustyGasTwoPhaseFlowsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem dusty_gas_two_phase_flows_endgame (A : AdmissibleClass) : DustyGasTwoPhaseFlowsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse