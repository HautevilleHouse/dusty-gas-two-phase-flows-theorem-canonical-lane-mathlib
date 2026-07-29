import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean.DustyGasBridgeLemmas

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean

/-!
# Dusty Gas Gate Lemmas

This module defines the gate closure predicate for the dusty gas admissible
class and provides the gate lemma.
-/

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean
end HautevilleHouse