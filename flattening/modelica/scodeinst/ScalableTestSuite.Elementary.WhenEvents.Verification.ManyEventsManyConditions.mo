package ScalableTestSuite  "A library of scalable Modelica test models" 
  package Elementary  "Elementary models to stress some aspects of the tool" 
    package WhenEvents  "Models large number of when statements and events" 
      package Models  
        model ManyEventsManyConditions  "Model with many events in when clauses and a when clause with many triggering conditions" 
          parameter Integer N = 5;
          Real[N] x(each start = 0, each fixed = true);
          Boolean[N] e(each start = false, each fixed = true);
          Integer v(start = 0, fixed = true);
        equation
          for i in 1:N loop
            der(x[i]) = 1 / i;
            when x[i] > 1 then
              e[i] = true;
            end when;
          end for;
          when e then
            v = pre(v) + 1;
          end when;
        end ManyEventsManyConditions;
      end Models;

      package Verification  
        model ManyEventsManyConditions  
          extends Models.ManyEventsManyConditions(N = 20);
          annotation(experiment(StopTime = 2), Documentation(info = "<html><p>The model contains N integrators x[i] with different integration rates.
                When each state values crosses the value of one, a when clause is triggered, switching the
                corresponding boolean e[i] from false to true. </p>
                <p>Additionally, a single when clause monitors the changes of the entire e vector, and increases the value
                of v by one each time any when clause is triggered.<p>
                <p>If the model is run with StopTime = N/10, only about
                one tenth of the when clauses are actually triggered, to save on simulation time.</p></html>")); 
        end ManyEventsManyConditions;
      end Verification;
    end WhenEvents;
  end Elementary;
  annotation(version = "1.8.2", uses(Modelica(version = "3.2.2")), Documentation(info = "<html>
<p>This library contains a collection of Modelica models whose size can be scaled by means of integer parameter(s). This is useful to test the ability of Modelica tools to compile and simulate models of  increasing size efficiently.</p>
<p>The library contains examples with a physical motivation, which are also verified against known analytical solutions wherever possible, as well as elementary models to stress some specific features of the Modelica tools.</p>
<p>In some cases, when feasible, two mathematically equivalent models are provided, one built by raw equations and the other one built using the Modelica Standard Library. This makes it possible to evaluate how efficiently the Modelica tool can handle the overhead of a modular description both in terms of compilation time, which might be higher due to additional processing, and of simulation time, which should be the same.</p>
<p>This work was originally inspired by discussion at the <a href=\"http://www.eoolt.org/2014/index.php\">2014 EOOLT Workshop in Berlin</a>. Version 1.0.0 is the outcome of Kaan Sezginer&apos;s<a href=\"modelica://ScalableTestSuite/Resources/Docs/2015_04_SEZGINER_Thesis.pdf\"> master&apos;s thesis</a> work at Politecnico di Milano, under the supervision of prof. Francesco Casella. It is expected that the library grows and becomes a reference for the community.</p>
<p>The master branch of the library is hosted on <a href=\"https://github.com/casella/ScalableTestSuite\">GitHub</a>. Please contact , please contact<a href=\"mailto:francesco.casella@polimi.it\"> Francesco Casella</a> or directly submit a pull request
if you want to contribute to the library.
<p>Main Authors</p>
<ul>
<li>Kaan Sezginer</li>
<li>Francesco Casella</li>
</ul>
<p>Copyright  &copy; 2015-2016 Politecnico di Milano</p>
<p>All rights reserved.</p>

<p>Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:</p>
<ol>
<li>Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.</li>
<li>Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.</li>
<li>Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software without
specific prior written permission.</li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &quot;AS IS&quot;
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE 
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE
</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-100, 50}, {50, -100}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-100, 0}, {0, -100}}, lineColor = {0, 0, 0}, fillColor = {135, 135, 135}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-100, -40}, {-40, -100}}, lineColor = {0, 0, 0}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-100, -70}, {-68, -100}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)})); 
end ScalableTestSuite;

model ManyEventsManyConditions_total
  extends ScalableTestSuite.Elementary.WhenEvents.Verification.ManyEventsManyConditions;
 annotation(experiment(StopTime = 2), Documentation(info = "<html><p>The model contains N integrators x[i] with different integration rates.
        When each state values crosses the value of one, a when clause is triggered, switching the
        corresponding boolean e[i] from false to true. </p>
        <p>Additionally, a single when clause monitors the changes of the entire e vector, and increases the value
        of v by one each time any when clause is triggered.<p>
        <p>If the model is run with StopTime = N/10, only about
        one tenth of the when clauses are actually triggered, to save on simulation time.</p></html>"));
end ManyEventsManyConditions_total;
