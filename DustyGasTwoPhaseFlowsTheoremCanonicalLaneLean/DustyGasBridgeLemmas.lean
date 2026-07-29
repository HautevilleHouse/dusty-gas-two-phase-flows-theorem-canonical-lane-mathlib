import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean.DustyGasAdmissibleClass

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean

/-!
# Dusty Gas Bridge Lemmas

This module defines the bridge closure predicate for the dusty gas admissible
class and provides the bridge lemma from an admissible class.
-/

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.sourceKeyChecked A.object.theoremObjectChecked

end DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean
end HautevilleHouse