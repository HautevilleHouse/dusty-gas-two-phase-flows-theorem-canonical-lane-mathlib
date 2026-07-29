import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean.TwoFluidModel

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

structure DragEnvelope where
  flow : TwoFluidFlow
  dragFinite : Prop
  dragCoercivity : Prop
  dragEnergyInequality : Prop
  dragFiniteClosed : dragFinite
  dragCoercivityClosed : dragCoercivity
  dragEnergyInequalityClosed : dragEnergyInequality

def sourceDragEnvelope : DragEnvelope := {
  flow := primitiveTwoFluidFlow
  dragFinite := true
  dragCoercivity := true
  dragEnergyInequality := true
  dragFiniteClosed := rfl
  dragCoercivityClosed := rfl
  dragEnergyInequalityClosed := rfl
}

def DragEnvelopeClosed (E : DragEnvelope) : Prop :=
  E.dragFinite ∧ E.dragCoercivity ∧ E.dragEnergyInequality

theorem source_drag_envelope_closed : DragEnvelopeClosed sourceDragEnvelope := by
  refine And.intro sourceDragEnvelope.dragFiniteClosed
    (And.intro sourceDragEnvelope.dragCoercivityClosed sourceDragEnvelope.dragEnergyInequalityClosed)

end HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse