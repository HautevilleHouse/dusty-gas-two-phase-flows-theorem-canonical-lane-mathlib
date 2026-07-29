import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean.DustyGasFinalTheorem
import HautevilleHouse.DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean.DustyGasFormalization

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean

/-!
# Dusty Gas Analytic Closure

This module states the admitted analytic closure theorem for the dusty gas
package, combining the constrained theorem closure with the formalization
certificate boundary.
-/

def DustyGasAdmittedAnalyticClosure : Prop :=
  DustyGasConstrainedTheoremClosure dustyGasAdmissibleClass ∧
  sourceDustyGasFormalizationCertificate.theoremBoundaryOpen = true

theorem dusty_gas_admitted_analytic_closure_checked :
    DustyGasAdmittedAnalyticClosure := by
  exact And.intro (dusty_gas_constrained_theorem_closure dustyGasAdmissibleClass) rfl

end DustyGasTwoPhaseFlowsTheoremCanonicalLaneLean
end HautevilleHouse