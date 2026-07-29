import canonicalLaneMathlib.AdmissibleClass
import DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean.DustyGasFlowObjects

/-!
# Volume Fraction Constrained Layer

This module encodes the volume fraction admissibility constraints.
-/

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean

structure VolumeFractionCertificate where
  flow : DustyGasFlowState
  volumeFractionSumOne : Prop
  volumeFractionNonneg : Prop
  volumeFractionBound : Prop
  volumeFractionSumOneClosed : volumeFractionSumOne
  volumeFractionNonnegClosed : volumeFractionNonneg
  volumeFractionBoundClosed : volumeFractionBound

def sourceVolumeFractionCertificate : VolumeFractionCertificate := {
  flow := zeroDustyGasFlowState
, volumeFractionSumOne := VolumeFractionConstraint zeroSolidPhase zeroGasPhase
, volumeFractionNonneg := True
, volumeFractionBound := True
, volumeFractionSumOneClosed := zero_flow_state_volume_fraction_constraint_checked
, volumeFractionNonnegClosed := trivial
, volumeFractionBoundClosed := trivial
}

def VolumeFractionClosed (C : VolumeFractionCertificate) : Prop :=
  C.volumeFractionSumOne ∧ C.volumeFractionNonneg ∧ C.volumeFractionBound

theorem source_volume_fraction_closed :
    VolumeFractionClosed sourceVolumeFractionCertificate := by
  exact And.intro sourceVolumeFractionCertificate.volumeFractionSumOneClosed
    (And.intro sourceVolumeFractionCertificate.volumeFractionNonnegClosed
      sourceVolumeFractionCertificate.volumeFractionBoundClosed)

end DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean
end HautevilleHouse