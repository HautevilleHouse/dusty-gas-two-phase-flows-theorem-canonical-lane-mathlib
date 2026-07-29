import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean.DustyClosureGateLayer

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DustyAdmittedObject where
  object : TheoremSpecificObject
  localWitness : String
  bridgeEvidence : String
  sourceKeyChecked : object.sourceKey = sourceRepository
  theoremObjectChecked : object.theoremObject = sourceDescription

def dustyAdmittedObject : DustyAdmittedObject := {
  object := theoremSpecificObject
  localWitness := "Dusty gas two-phase flows admissible closure"
  bridgeEvidence := "source-derived Lean certificate fields"
  sourceKeyChecked := rfl
  theoremObjectChecked := rfl
}

def dustyAdmissibleClass : AdmissibleClass := {
  object := dustyAdmittedObject.object
  endpointSatisfied := TwoFluidEquationsClosed primitiveTwoFluidFlow
  remainderRecorded := true
  gateWitness := Or.inl primitive_two_fluid_equations_closed
}

def DustyAdmissibleClassClosed (A : AdmissibleClass) : Prop :=
  DustyClosureGateClosed sourceDustyClosureGateCertificate ∧ bridgeClosed A ∧ gateClosed A

theorem source_dusty_admissible_class_closed : DustyAdmissibleClassClosed dustyAdmissibleClass := by
  refine And.intro source_dusty_closure_gate_closed (And.intro ?_ ?_)
  · exact bridge_from_admissible_class dustyAdmissibleClass
  · exact gate_from_admissible_class dustyAdmissibleClass

end HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse