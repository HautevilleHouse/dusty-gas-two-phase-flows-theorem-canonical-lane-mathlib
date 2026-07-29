import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean.DustyGasAnalyticCertificate

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean

def DustyGasConstrainedTheoremClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem dusty_gas_constrained_theorem_closure (A : AdmissibleClass) :
    DustyGasConstrainedTheoremClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

-- Aggregate closure theorem for the dusty gas package
def DustyGasAdmittedAnalyticClosure : Prop :=
  DustyGasAnalyticCertificateClosed sourceDustyGasAnalyticCertificate ∧
  DustyGasConstrainedTheoremClosure dustyGasAdmissibleClass

theorem dusty_gas_admitted_analytic_closure_checked :
    DustyGasAdmittedAnalyticClosure := by
  exact And.intro source_dusty_gas_analytic_certificate_closed
    (dusty_gas_constrained_theorem_closure dustyGasAdmissibleClass)

end DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean
end HautevilleHouse
