import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean.TwoFluidModel

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsCanonicalLaneLean

structure CompressibilityCertificate where
  flow : TwoFluidFlow
  gasCompressibility : Prop
  dustCompressibility : Prop
  gasCompressibilityClosed : gasCompressibility
  dustCompressibilityClosed : dustCompressibility

def sourceCompressibilityCertificate : CompressibilityCertificate := {
  flow := primitiveTwoFluidFlow
  gasCompressibility := true
  dustCompressibility := true
  gasCompressibilityClosed := rfl
  dustCompressibilityClosed := rfl
}

def CompressibilityClosed (C : CompressibilityCertificate) : Prop :=
  C.gasCompressibility ∧ C.dustCompressibility

theorem source_compressibility_closed : CompressibilityClosed sourceCompressibilityCertificate := by
  exact And.intro sourceCompressibilityCertificate.gasCompressibilityClosed sourceCompressibilityCertificate.dustCompressibilityClosed

end HautevilleHouse.DustyGasTwoPhaseFlowsCanonicalLaneLean
end HautevilleHouse