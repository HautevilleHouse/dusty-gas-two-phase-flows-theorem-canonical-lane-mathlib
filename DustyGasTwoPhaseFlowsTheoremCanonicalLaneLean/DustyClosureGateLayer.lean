import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean.DustyDragLayer
import HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean.GasDustCompressibilityLayer

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

structure DustyClosureGateCertificate where
  drag : DragEnvelope
  compressibility : CompressibilityCertificate
  dragClosed : DragEnvelopeClosed drag
  compressibilityClosed : CompressibilityClosed compressibility

def sourceDustyClosureGateCertificate : DustyClosureGateCertificate := {
  drag := sourceDragEnvelope
  compressibility := sourceCompressibilityCertificate
  dragClosed := source_drag_envelope_closed
  compressibilityClosed := source_compressibility_closed
}

def DustyClosureGateClosed (C : DustyClosureGateCertificate) : Prop :=
  DragEnvelopeClosed C.drag ∧ CompressibilityClosed C.compressibility

theorem source_dusty_closure_gate_closed : DustyClosureGateClosed sourceDustyClosureGateCertificate := by
  exact And.intro sourceDustyClosureGateCertificate.dragClosed sourceDustyClosureGateCertificate.compressibilityClosed

end HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse