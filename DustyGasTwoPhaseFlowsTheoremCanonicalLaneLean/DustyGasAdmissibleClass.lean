import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean.DustyGasTwoPhaseFlow
import HautevilleHouse.DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean.DustyGasClosureLayer

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean

/-!
# Dusty Gas Admissible Class

This module constructs the admissible class object for the dusty gas two-phase
flows theorem, combining the flow model and the closure certificate.
-/

def dustyGasAdmittedObject : AdmittedTheoremObject := {
  object := {
    sourceKey := "dusty-gas-two-phase-flows"
    theoremObject := "DustyGasTwoPhaseFlowsTheorem"
    claimBoundary := "primitive two-phase flow model"
  }
  localWitness := "closure certificate"
  bridgeEvidence := "source-derived Lean certificate"
  sourceKeyChecked := by rfl
  theoremObjectChecked := by rfl
}

def dustyGasAdmissibleClass : AdmissibleClass := {
  object := dustyGasAdmittedObject
  endpointSatisfied := DustyGasClosureClosed sourceDustyGasClosureCertificate
  remainderRecorded := True
  gateWitness := Or.inl source_dusty_gas_closure_closed
}

end DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean
end HautevilleHouse