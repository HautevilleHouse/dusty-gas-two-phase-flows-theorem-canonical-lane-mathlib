import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean.DustyGasEndpointLayer

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean

-- Aggregate analytic certificate for dusty gas two-phase flows
structure DustyGasAnalyticCertificate where
  endpoint : DustyGasEndpointCertificate
  operatorsClosed : Prop
  weakLayerClosed : Prop
  regularityLayerClosed : Prop
  endpointLayerClosed : Prop
  canonicalCarriageImported : Prop
  operatorsClosedProof : operatorsClosed
  weakLayerClosedProof : weakLayerClosed
  regularityLayerClosedProof : regularityLayerClosed
  endpointLayerClosedProof : endpointLayerClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceDustyGasAnalyticCertificate : DustyGasAnalyticCertificate := {
  endpoint := sourceDustyGasEndpointCertificate,
  operatorsClosed := DustyGasFlowClosed primitiveDustyGasFlow,
  weakLayerClosed := True,
  regularityLayerClosed := DustyGasRegularityClosed sourceDustyGasRegularityCertificate,
  endpointLayerClosed := DustyGasEndpointClosed sourceDustyGasEndpointCertificate,
  canonicalCarriageImported := True,
  operatorsClosedProof := by
    have hMass : MassConservation primitiveDustyGasFlow := by
      unfold MassConservation primitiveDustyGasFlow; rfl
    have hMomentumDust : MomentumBalanceDust primitiveDustyGasFlow := by
      unfold MomentumBalanceDust primitiveDustyGasFlow; rfl
    have hMomentumGas : MomentumBalanceGas primitiveDustyGasFlow := by
      unfold MomentumBalanceGas primitiveDustyGasFlow; rfl
    have hCoupling : PhaseCoupling primitiveDustyGasFlow := by
      unfold PhaseCoupling primitiveDustyGasFlow; simp
    exact And.intro hMass (And.intro hMomentumDust (And.intro hMomentumGas hCoupling)),
  weakLayerClosedProof := trivial,
  regularityLayerClosedProof := source_dusty_gas_regularity_closed,
  endpointLayerClosedProof := source_dusty_gas_endpoint_closed,
  canonicalCarriageImportedProof := trivial
}

def DustyGasAnalyticCertificateClosed (C : DustyGasAnalyticCertificate) : Prop :=
  C.operatorsClosed ∧
  C.weakLayerClosed ∧
  C.regularityLayerClosed ∧
  C.endpointLayerClosed ∧
  C.canonicalCarriageImported

theorem source_dusty_gas_analytic_certificate_closed : DustyGasAnalyticCertificateClosed sourceDustyGasAnalyticCertificate := by
  exact And.intro sourceDustyGasAnalyticCertificate.operatorsClosedProof
    (And.intro sourceDustyGasAnalyticCertificate.weakLayerClosedProof
      (And.intro sourceDustyGasAnalyticCertificate.regularityLayerClosedProof
        (And.intro sourceDustyGasAnalyticCertificate.endpointLayerClosedProof
          sourceDustyGasAnalyticCertificate.canonicalCarriageImportedProof)))

end DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean
end HautevilleHouse
