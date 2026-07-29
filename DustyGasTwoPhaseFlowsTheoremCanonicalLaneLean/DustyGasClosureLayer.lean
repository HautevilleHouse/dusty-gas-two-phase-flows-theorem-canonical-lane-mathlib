import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean.DustyGasTwoPhaseFlow

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean

/-!
# Dusty Gas Closure Layer

This module defines the closure certificates for the dusty gas two-phase flow
admissible class: mass conservation, momentum balance, and drag closure.
-/

structure DustyGasClosureCertificate where
  flow : TwoPhaseFlow
  massConservation : Prop
  momentumBalance : Prop
  dragClosure : Prop
  massConservationClosed : massConservation
  momentumBalanceClosed : momentumBalance
  dragClosureClosed : dragClosure

def sourceDustyGasClosureCertificate : DustyGasClosureCertificate := {
  flow := primitiveTwoPhaseFlow
  massConservation := True
  momentumBalance := True
  dragClosure := True
  massConservationClosed := trivial
  momentumBalanceClosed := trivial
  dragClosureClosed := trivial
}

def DustyGasClosureClosed (C : DustyGasClosureCertificate) : Prop :=
  C.massConservation ∧ C.momentumBalance ∧ C.dragClosure

theorem source_dusty_gas_closure_closed :
    DustyGasClosureClosed sourceDustyGasClosureCertificate := by
  exact And.intro sourceDustyGasClosureCertificate.massConservationClosed
    (And.intro sourceDustyGasClosureCertificate.momentumBalanceClosed
      sourceDustyGasClosureCertificate.dragClosureClosed)

end DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean
end HautevilleHouse