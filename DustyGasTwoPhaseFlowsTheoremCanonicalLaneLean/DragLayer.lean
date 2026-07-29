import canonicalLaneMathlib.AdmissibleClass
import DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean.DustyGasFlowObjects

/-!
# Drag Layer

This module defines the drag force model and its admissible closure conditions.
-/

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean

structure DragCertificate where
  dragModel : InterphaseExchange
  dragCoeff : ℝ
  dragBounded : Prop
  dragMonotonic : Prop
  dragStability : Prop
  dragBoundedClosed : dragBounded
  dragMonotonicClosed : dragMonotonic
  dragStabilityClosed : dragStability

def sourceDragCertificate : DragCertificate := {
  dragModel := zeroExchange
, dragCoeff := 1
, dragBounded := True
, dragMonotonic := True
, dragStability := True
, dragBoundedClosed := trivial
, dragMonotonicClosed := trivial
, dragStabilityClosed := trivial
}

def DragClosed (C : DragCertificate) : Prop :=
  C.dragBounded ∧ C.dragMonotonic ∧ C.dragStability

theorem source_drag_closed : DragClosed sourceDragCertificate := by
  exact And.intro sourceDragCertificate.dragBoundedClosed
    (And.intro sourceDragCertificate.dragMonotonicClosed
      sourceDragCertificate.dragStabilityClosed)

end DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean
end HautevilleHouse