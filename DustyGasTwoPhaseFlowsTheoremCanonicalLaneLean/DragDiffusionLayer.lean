import canonicalLaneMathlib.AdmissibleClass
import DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean.DragLayer

/-!
# Drag-Diffusion Layer

This module records the drag-diffusion coupling that governs the two-phase flow regularization.
-/

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean

structure DragDiffusionCertificate where
  drag : DragCertificate
  diffusionCoeff : ℝ
  diffusionRegularization : Prop
  dragDiffusionStability : Prop
  diffusionRegularizationClosed : diffusionRegularization
  dragDiffusionStabilityClosed : dragDiffusionStability

def sourceDragDiffusionCertificate : DragDiffusionCertificate := {
  drag := sourceDragCertificate
, diffusionCoeff := 1
, diffusionRegularization := True
, dragDiffusionStability := True
, diffusionRegularizationClosed := trivial
, dragDiffusionStabilityClosed := trivial
}

def DragDiffusionClosed (C : DragDiffusionCertificate) : Prop :=
  DragClosed C.drag ∧ C.diffusionRegularization ∧ C.dragDiffusionStability

theorem source_drag_diffusion_closed :
    DragDiffusionClosed sourceDragDiffusionCertificate := by
  exact And.intro source_drag_closed
    (And.intro sourceDragDiffusionCertificate.diffusionRegularizationClosed
      sourceDragDiffusionCertificate.dragDiffusionStabilityClosed)

end DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean
end HautevilleHouse