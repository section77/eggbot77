<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.7.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="frames">
<description>&lt;b&gt;Frames for Sheet and Layout&lt;/b&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="A4L-LOC">
<wire x1="256.54" y1="3.81" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="256.54" y1="8.89" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="256.54" y1="13.97" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="256.54" y1="19.05" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="3.81" x2="161.29" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="24.13" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<wire x1="215.265" y1="24.13" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="246.38" y1="3.81" x2="246.38" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="215.265" y2="8.89" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="215.265" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<text x="217.17" y="15.24" size="2.54" layer="94">&gt;DRAWING_NAME</text>
<text x="217.17" y="10.16" size="2.286" layer="94">&gt;LAST_DATE_TIME</text>
<text x="230.505" y="5.08" size="2.54" layer="94">&gt;SHEET</text>
<text x="216.916" y="4.953" size="2.54" layer="94">Sheet:</text>
<frame x1="0" y1="0" x2="260.35" y2="179.07" columns="6" rows="4" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="A4L-LOC" prefix="FRAME" uservalue="yes">
<description>&lt;b&gt;FRAME&lt;/b&gt;&lt;p&gt;
DIN A4, landscape with location and doc. field</description>
<gates>
<gate name="G$1" symbol="A4L-LOC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="lib_s77_eggbot">
<packages>
<package name="CARRIER_A4988">
<description>A4988 carrier board
based on &lt;a href&gt;https://www.pololu.com/file/0J1082/a4988-stepper-motor-driver-carrier-dimension-diagram.pdf&lt;/a&gt;</description>
<wire x1="-7.62" y1="-8.89" x2="-7.62" y2="11.43" width="0.127" layer="21"/>
<wire x1="-7.62" y1="11.43" x2="7.62" y2="11.43" width="0.127" layer="21"/>
<wire x1="7.62" y1="11.43" x2="7.62" y2="-8.89" width="0.127" layer="21"/>
<wire x1="7.62" y1="-8.89" x2="-7.62" y2="-8.89" width="0.127" layer="21"/>
<pad name="8" x="-6.35" y="-7.62" drill="0.9" shape="octagon"/>
<pad name="7" x="-6.35" y="-5.08" drill="0.9" shape="octagon"/>
<pad name="6" x="-6.35" y="-2.54" drill="0.9" shape="octagon"/>
<pad name="5" x="-6.35" y="0" drill="0.9" shape="octagon"/>
<pad name="4" x="-6.35" y="2.54" drill="0.9" shape="octagon"/>
<pad name="3" x="-6.35" y="5.08" drill="0.9" shape="octagon"/>
<pad name="2" x="-6.35" y="7.62" drill="0.9" shape="octagon"/>
<pad name="1" x="-6.35" y="10.16" drill="0.9" shape="octagon"/>
<pad name="16" x="6.35" y="10.16" drill="0.9" shape="octagon"/>
<pad name="15" x="6.35" y="7.62" drill="0.9" shape="octagon"/>
<pad name="14" x="6.35" y="5.08" drill="0.9" shape="octagon"/>
<pad name="13" x="6.35" y="2.54" drill="0.9" shape="octagon"/>
<pad name="12" x="6.35" y="0" drill="0.9" shape="octagon"/>
<pad name="11" x="6.35" y="-2.54" drill="0.9" shape="octagon"/>
<pad name="10" x="6.35" y="-5.08" drill="0.9" shape="octagon"/>
<pad name="9" x="6.35" y="-7.62" drill="0.9" shape="octagon"/>
<text x="-5.08" y="10.16" size="1.27" layer="21" align="center-left">!EN</text>
<text x="-5.08" y="7.62" size="1.27" layer="21" align="center-left">MS1</text>
<text x="-5.08" y="5.08" size="1.27" layer="21" align="center-left">MS2</text>
<text x="-5.08" y="2.54" size="1.27" layer="21" align="center-left">MS3</text>
<text x="-5.08" y="0" size="1.27" layer="21" align="center-left">!RST</text>
<text x="-5.08" y="-2.54" size="1.27" layer="21" align="center-left">!SLP</text>
<text x="-5.08" y="-5.08" size="1.27" layer="21" align="center-left">STEP</text>
<text x="-5.08" y="-7.62" size="1.27" layer="21" align="center-left">DIR</text>
<text x="5.08" y="10.16" size="1.27" layer="21" align="center-right">VMOT</text>
<text x="5.08" y="7.62" size="1.27" layer="21" align="center-right">GND</text>
<text x="5.08" y="5.08" size="1.27" layer="21" align="center-right">2B</text>
<text x="5.08" y="2.54" size="1.27" layer="21" align="center-right">2A</text>
<text x="5.08" y="0" size="1.27" layer="21" align="center-right">1A</text>
<text x="5.08" y="-2.54" size="1.27" layer="21" align="center-right">1B</text>
<text x="5.08" y="-5.08" size="1.27" layer="21" align="center-right">VDD</text>
<text x="5.08" y="-7.62" size="1.27" layer="21" align="center-right">GND</text>
<text x="-7.62" y="12.7" size="1.778" layer="25">&gt;NAME</text>
<text x="-7.62" y="-11.43" size="1.778" layer="27">&gt;VALUE</text>
</package>
<package name="S2_MINI">
<wire x1="0" y1="7.62" x2="0" y2="30.48" width="0.127" layer="21"/>
<wire x1="3.81" y1="34.29" x2="21.59" y2="34.29" width="0.127" layer="21"/>
<hole x="2.5" y="30.988" drill="2"/>
<hole x="22.9" y="30.988" drill="2"/>
<pad name="8" x="1.27" y="8.89" drill="0.9" shape="octagon"/>
<pad name="24" x="3.81" y="8.89" drill="0.9" shape="octagon"/>
<pad name="7" x="1.27" y="11.43" drill="0.9" shape="octagon"/>
<pad name="23" x="3.81" y="11.43" drill="0.9" shape="octagon"/>
<pad name="6" x="1.27" y="13.97" drill="0.9" shape="octagon"/>
<pad name="5" x="1.27" y="16.51" drill="0.9" shape="octagon"/>
<pad name="4" x="1.27" y="19.05" drill="0.9" shape="octagon"/>
<pad name="3" x="1.27" y="21.59" drill="0.9" shape="octagon"/>
<pad name="2" x="1.27" y="24.13" drill="0.9" shape="octagon"/>
<pad name="1" x="1.27" y="26.67" drill="0.9" shape="octagon"/>
<pad name="17" x="3.81" y="26.67" drill="0.9" shape="octagon"/>
<pad name="18" x="3.81" y="24.13" drill="0.9" shape="octagon"/>
<pad name="19" x="3.81" y="21.59" drill="0.9" shape="octagon"/>
<pad name="20" x="3.81" y="19.05" drill="0.9" shape="octagon"/>
<pad name="21" x="3.81" y="16.51" drill="0.9" shape="octagon"/>
<pad name="22" x="3.81" y="13.97" drill="0.9" shape="octagon"/>
<pad name="9" x="24.13" y="8.89" drill="0.9" shape="octagon"/>
<pad name="25" x="21.59" y="8.89" drill="0.9" shape="octagon"/>
<pad name="10" x="24.13" y="11.43" drill="0.9" shape="octagon"/>
<pad name="26" x="21.59" y="11.43" drill="0.9" shape="octagon"/>
<pad name="11" x="24.13" y="13.97" drill="0.9" shape="octagon"/>
<pad name="27" x="21.59" y="13.97" drill="0.9" shape="octagon"/>
<pad name="12" x="24.13" y="16.51" drill="0.9" shape="octagon"/>
<pad name="28" x="21.59" y="16.51" drill="0.9" shape="octagon"/>
<pad name="13" x="24.13" y="19.05" drill="0.9" shape="octagon"/>
<pad name="29" x="21.59" y="19.05" drill="0.9" shape="octagon"/>
<pad name="14" x="24.13" y="21.59" drill="0.9" shape="octagon"/>
<pad name="30" x="21.59" y="21.59" drill="0.9" shape="octagon"/>
<pad name="15" x="24.13" y="24.13" drill="0.9" shape="octagon"/>
<pad name="31" x="21.59" y="24.13" drill="0.9" shape="octagon"/>
<pad name="16" x="24.13" y="26.67" drill="0.9" shape="octagon"/>
<pad name="32" x="21.59" y="26.67" drill="0.9" shape="octagon"/>
<wire x1="25.4" y1="30.48" x2="25.4" y2="0" width="0.127" layer="21"/>
<wire x1="0" y1="30.48" x2="3.81" y2="34.29" width="0.127" layer="21" curve="-90"/>
<wire x1="21.59" y1="34.29" x2="25.4" y2="30.48" width="0.127" layer="21" curve="-90"/>
<wire x1="0" y1="7.62" x2="2.54" y2="6.35" width="0.127" layer="21"/>
<wire x1="2.54" y1="6.35" x2="2.54" y2="0" width="0.127" layer="21"/>
<wire x1="2.54" y1="0" x2="8.89" y2="0" width="0.127" layer="21"/>
<wire x1="8.89" y1="0" x2="16.51" y2="0" width="0.127" layer="21"/>
<wire x1="16.51" y1="0" x2="25.4" y2="0" width="0.127" layer="21"/>
<wire x1="8.89" y1="0" x2="8.89" y2="7.62" width="0.127" layer="21"/>
<wire x1="8.89" y1="7.62" x2="16.51" y2="7.62" width="0.127" layer="21"/>
<wire x1="16.51" y1="7.62" x2="16.51" y2="0" width="0.127" layer="21"/>
<text x="0" y="35.56" size="1.778" layer="25">&gt;NAME</text>
<text x="2.54" y="-3.81" size="1.778" layer="25">&gt;VALUE</text>
</package>
<package name="CR_LM2596">
<wire x1="0" y1="0" x2="0" y2="21" width="0.127" layer="21"/>
<wire x1="0" y1="21" x2="42" y2="21" width="0.127" layer="21"/>
<wire x1="42" y1="21" x2="42" y2="0" width="0.127" layer="21"/>
<wire x1="42" y1="0" x2="0" y2="0" width="0.127" layer="21"/>
<pad name="2" x="1" y="1.65" drill="0.9" diameter="1.4224" shape="octagon"/>
<pad name="3" x="41" y="1.65" drill="0.9" diameter="1.4224" shape="octagon"/>
<pad name="1" x="1" y="19.35" drill="0.9" diameter="1.4224" shape="octagon"/>
<pad name="4" x="41" y="19.35" drill="0.9" diameter="1.4224" shape="octagon"/>
<text x="3" y="11" size="1.27" layer="21" rot="R90" align="center">IN
3.2V - 46V</text>
<text x="39" y="11" size="1.27" layer="21" rot="R90" align="center">OUT
1.25V - 35V</text>
<text x="22" y="11" size="1.27" layer="21" align="center">LM2596</text>
<text x="0" y="21.59" size="1.778" layer="25">&gt;NAME</text>
<text x="0" y="-2.54" size="1.778" layer="25">&gt;VALUE</text>
</package>
<package name="POLLIN_JACK_A">
<description>Quellen:&lt;br&gt;
&lt;a href="https://www.pollin.de/productdownloads/D452316D.PDF"&gt;Pollin 452 316 (5.5/2.1mm)&lt;/a&gt;&lt;br&gt;
&lt;a href="&gt;https://www.pollin.de/productdownloads/D451810D.PDF"&gt;Pollin 451 810 (5.5/2.5mm)&lt;/a&gt;</description>
<wire x1="1.4" y1="2.5" x2="-1.4" y2="2.5" width="0" layer="46"/>
<wire x1="-1.4" y1="2.5" x2="-1.4" y2="3.5" width="0" layer="46"/>
<wire x1="-1.4" y1="3.5" x2="1.4" y2="3.5" width="0" layer="46"/>
<wire x1="1.4" y1="3.5" x2="1.4" y2="2.5" width="0" layer="46"/>
<wire x1="5.2" y1="1.2" x2="4.2" y2="1.2" width="0" layer="46"/>
<wire x1="4.2" y1="1.2" x2="4.2" y2="-1.2" width="0" layer="46"/>
<wire x1="4.2" y1="-1.2" x2="5.2" y2="-1.2" width="0" layer="46"/>
<wire x1="5.2" y1="-1.2" x2="5.2" y2="1.2" width="0" layer="46"/>
<wire x1="1.4" y1="-3.7" x2="-1.4" y2="-3.7" width="0" layer="46"/>
<wire x1="-1.4" y1="-3.7" x2="-1.4" y2="-2.7" width="0" layer="46"/>
<wire x1="-1.4" y1="-2.7" x2="1.4" y2="-2.7" width="0" layer="46"/>
<wire x1="1.4" y1="-2.7" x2="1.4" y2="-3.7" width="0" layer="46"/>
<wire x1="-4.3" y1="-10.7" x2="4.3" y2="-10.7" width="0.2032" layer="21"/>
<wire x1="4.3" y1="-10.4" x2="4.3" y2="3.9" width="0.2032" layer="51"/>
<wire x1="4.3" y1="3.9" x2="-4.3" y2="3.9" width="0.2032" layer="51"/>
<wire x1="-4.3" y1="3.9" x2="-4.3" y2="-10.7" width="0.2032" layer="21"/>
<wire x1="-2.7" y1="3.9" x2="-4.3" y2="3.9" width="0.2032" layer="21"/>
<wire x1="4.3" y1="3.9" x2="2.7" y2="3.9" width="0.2032" layer="21"/>
<wire x1="-3" y1="-10.7" x2="-3" y2="-3.2" width="0.2032" layer="51" style="shortdash"/>
<wire x1="3" y1="-10.7" x2="3" y2="-3.2" width="0.2032" layer="51" style="shortdash"/>
<wire x1="3" y1="-3.2" x2="-3" y2="-3.2" width="0.2032" layer="51" style="shortdash"/>
<wire x1="-0.9" y1="-9" x2="-0.9" y2="-4.5" width="0.2032" layer="51" style="shortdash"/>
<wire x1="0.9" y1="-9" x2="0.9" y2="-4.5" width="0.2032" layer="51" style="shortdash"/>
<wire x1="-0.9" y1="-9" x2="0.9" y2="-9" width="0.2032" layer="51" curve="166.57811"/>
<wire x1="4.3" y1="-10.7" x2="4.3" y2="-2.45" width="0.2032" layer="21"/>
<wire x1="4.3" y1="2.3" x2="4.3" y2="3.9" width="0.2032" layer="21"/>
<pad name="2" x="0" y="3" drill="1" diameter="2" shape="long" rot="R180"/>
<pad name="1" x="0" y="-3.2" drill="1" diameter="2" shape="long" rot="R180"/>
<pad name="3" x="4.7" y="0" drill="1" diameter="2" shape="long" rot="R90"/>
<text x="6.35" y="-10.16" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="-5.08" y="-10.16" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="CARRIER_A4988">
<description>A4988 carrier board</description>
<pin name="!ENABLE" x="-5.08" y="30.48" length="middle" direction="in"/>
<pin name="MS1" x="-5.08" y="22.86" length="middle" direction="in"/>
<pin name="MS2" x="-5.08" y="20.32" length="middle" direction="in"/>
<pin name="MS3" x="-5.08" y="17.78" length="middle" direction="in"/>
<pin name="!RESET" x="-5.08" y="33.02" length="middle" direction="in"/>
<pin name="!SLEEP" x="-5.08" y="27.94" length="middle" direction="in"/>
<pin name="STEP" x="-5.08" y="10.16" length="middle" direction="in"/>
<pin name="DIR" x="-5.08" y="12.7" length="middle" direction="in"/>
<pin name="VDD" x="-5.08" y="38.1" length="middle" direction="pwr"/>
<pin name="GND@1" x="-5.08" y="5.08" length="middle" direction="pwr"/>
<pin name="VMOT" x="-5.08" y="43.18" length="middle" direction="pwr"/>
<pin name="OUT_1A" x="30.48" y="30.48" length="middle" direction="out" rot="R180"/>
<pin name="OUT_1B" x="30.48" y="27.94" length="middle" direction="out" rot="R180"/>
<pin name="OUT_2A" x="30.48" y="22.86" length="middle" direction="out" rot="R180"/>
<pin name="OUT_2B" x="30.48" y="20.32" length="middle" direction="out" rot="R180"/>
<pin name="GND@2" x="-5.08" y="2.54" length="middle" direction="pwr"/>
<wire x1="0" y1="45.72" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="25.4" y2="0" width="0.254" layer="94"/>
<wire x1="25.4" y1="0" x2="25.4" y2="45.72" width="0.254" layer="94"/>
<wire x1="25.4" y1="45.72" x2="0" y2="45.72" width="0.254" layer="94"/>
<text x="0" y="48.26" size="1.778" layer="95">&gt;NAME</text>
<text x="0" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="S2_MINI">
<description>Based on &lt;a href&gt;https://www.wemos.cc/en/latest/_static/files/sch_s2_mini_v1.0.0.pdf&lt;/a&gt;</description>
<pin name="EN/SW1" x="-5.08" y="58.42" length="middle"/>
<pin name="VBUS" x="-5.08" y="66.04" length="middle" direction="pwr"/>
<pin name="+3V3" x="-5.08" y="63.5" length="middle" direction="pwr"/>
<pin name="GND@1" x="-5.08" y="5.08" length="middle" direction="pwr"/>
<pin name="GND@2" x="-5.08" y="2.54" length="middle" direction="pwr"/>
<pin name="IO1" x="33.02" y="68.58" length="middle" rot="R180"/>
<pin name="IO7/SCK" x="33.02" y="53.34" length="middle" rot="R180"/>
<pin name="IO9/MISO" x="33.02" y="48.26" length="middle" rot="R180"/>
<wire x1="0" y1="0" x2="0" y2="71.12" width="0.254" layer="94"/>
<wire x1="0" y1="71.12" x2="27.94" y2="71.12" width="0.254" layer="94"/>
<wire x1="27.94" y1="71.12" x2="27.94" y2="0" width="0.254" layer="94"/>
<wire x1="27.94" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<text x="0" y="73.66" size="1.778" layer="95">&gt;NAME</text>
<text x="0" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="IO2" x="33.02" y="66.04" length="middle" rot="R180"/>
<pin name="IO3" x="33.02" y="63.5" length="middle" rot="R180"/>
<pin name="IO4" x="33.02" y="60.96" length="middle" rot="R180"/>
<pin name="IO5" x="33.02" y="58.42" length="middle" rot="R180"/>
<pin name="IO6" x="33.02" y="55.88" length="middle" rot="R180"/>
<pin name="IO8" x="33.02" y="50.8" length="middle" rot="R180"/>
<pin name="IO10" x="33.02" y="45.72" length="middle" rot="R180"/>
<pin name="IO11/MOSI" x="33.02" y="43.18" length="middle" rot="R180"/>
<pin name="IO12" x="33.02" y="40.64" length="middle" rot="R180"/>
<pin name="IO13" x="33.02" y="38.1" length="middle" rot="R180"/>
<pin name="IO14" x="33.02" y="35.56" length="middle" rot="R180"/>
<pin name="IO15/LED" x="33.02" y="33.02" length="middle" rot="R180"/>
<pin name="IO16" x="33.02" y="30.48" length="middle" rot="R180"/>
<pin name="IO17" x="33.02" y="27.94" length="middle" rot="R180"/>
<pin name="IO18/PU10K" x="33.02" y="25.4" length="middle" rot="R180"/>
<pin name="IO21" x="33.02" y="22.86" length="middle" rot="R180"/>
<pin name="IO33/SDA" x="33.02" y="20.32" length="middle" rot="R180"/>
<pin name="IO34" x="33.02" y="17.78" length="middle" rot="R180"/>
<pin name="IO35/SCL" x="33.02" y="15.24" length="middle" rot="R180"/>
<pin name="IO36" x="33.02" y="12.7" length="middle" rot="R180"/>
<pin name="IO37" x="33.02" y="10.16" length="middle" rot="R180"/>
<pin name="IO38" x="33.02" y="7.62" length="middle" rot="R180"/>
<pin name="IO39" x="33.02" y="5.08" length="middle" rot="R180"/>
<pin name="IO40" x="33.02" y="2.54" length="middle" rot="R180"/>
</symbol>
<symbol name="CR_LM2596">
<pin name="GND@1" x="-5.08" y="5.08" length="middle" direction="pwr"/>
<pin name="GND@2" x="-5.08" y="2.54" length="middle" direction="pwr"/>
<pin name="IN" x="-5.08" y="10.16" length="middle" direction="pas"/>
<pin name="OUT" x="20.32" y="10.16" length="middle" direction="pas" rot="R180"/>
<wire x1="0" y1="12.7" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="15.24" y2="0" width="0.254" layer="94"/>
<wire x1="15.24" y1="0" x2="15.24" y2="12.7" width="0.254" layer="94"/>
<wire x1="15.24" y1="12.7" x2="0" y2="12.7" width="0.254" layer="94"/>
<text x="0" y="15.24" size="1.778" layer="95">&gt;NAME</text>
<text x="0" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="POLLIN_JACK_A">
<wire x1="-5.715" y1="1.27" x2="-5.715" y2="3.81" width="0.1524" layer="94" curve="-180"/>
<wire x1="-5.715" y1="3.81" x2="1.27" y2="3.81" width="0.1524" layer="94"/>
<wire x1="1.27" y1="3.81" x2="1.27" y2="1.27" width="0.1524" layer="94"/>
<wire x1="1.27" y1="1.27" x2="-5.715" y2="1.27" width="0.1524" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="4.445" width="0.1524" layer="94"/>
<wire x1="2.54" y1="4.445" x2="1.27" y2="4.445" width="0.1524" layer="94"/>
<wire x1="1.27" y1="4.445" x2="1.27" y2="3.81" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-5.715" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-5.715" y1="-2.54" x2="-6.35" y2="-1.27" width="0.1524" layer="94"/>
<wire x1="-6.35" y1="-1.27" x2="-6.985" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="-2.54" width="0.1524" layer="94"/>
<text x="-7.62" y="5.08" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="3" x="7.62" y="0" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="2" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" rot="R180"/>
<polygon width="0.1524" layer="94">
<vertex x="-2.54" y="-2.54"/>
<vertex x="-3.048" y="-1.27"/>
<vertex x="-2.032" y="-1.27"/>
</polygon>
<wire x1="2.54" y1="0" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="-2.54" y2="-2.54" width="0.1524" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CARRIER_A4988" prefix="U">
<description>A4988 carrier board based on Pololu #1182 drawings</description>
<gates>
<gate name="G$1" symbol="CARRIER_A4988" x="0" y="0"/>
</gates>
<devices>
<device name="" package="CARRIER_A4988">
<connects>
<connect gate="G$1" pin="!ENABLE" pad="1"/>
<connect gate="G$1" pin="!RESET" pad="5"/>
<connect gate="G$1" pin="!SLEEP" pad="6"/>
<connect gate="G$1" pin="DIR" pad="8"/>
<connect gate="G$1" pin="GND@1" pad="9"/>
<connect gate="G$1" pin="GND@2" pad="15"/>
<connect gate="G$1" pin="MS1" pad="2"/>
<connect gate="G$1" pin="MS2" pad="3"/>
<connect gate="G$1" pin="MS3" pad="4"/>
<connect gate="G$1" pin="OUT_1A" pad="12"/>
<connect gate="G$1" pin="OUT_1B" pad="11"/>
<connect gate="G$1" pin="OUT_2A" pad="13"/>
<connect gate="G$1" pin="OUT_2B" pad="14"/>
<connect gate="G$1" pin="STEP" pad="7"/>
<connect gate="G$1" pin="VDD" pad="10"/>
<connect gate="G$1" pin="VMOT" pad="16"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="S2_MINI" prefix="U">
<description>Based on&lt;br&gt;
&lt;a href&gt;https://www.wemos.cc/en/latest/_static/files/sch_s2_mini_v1.0.0.pdf&lt;/a&gt;
&lt;br&gt;and&lt;br&gt;
&lt;a href&gt;https://www.wemos.cc/en/latest/_static/boards/s2_mini_v1.0.0_2_16x16.jpg&lt;/a&gt;
&lt;br&gt;
IO0 -&gt; SW2&lt;br&gt;
IO15 -&gt; LED&lt;br&gt;
IO18-&gt;10k PullUp 3V3</description>
<gates>
<gate name="G$1" symbol="S2_MINI" x="0" y="0"/>
</gates>
<devices>
<device name="" package="S2_MINI">
<connects>
<connect gate="G$1" pin="+3V3" pad="8"/>
<connect gate="G$1" pin="EN/SW1" pad="1"/>
<connect gate="G$1" pin="GND@1" pad="10"/>
<connect gate="G$1" pin="GND@2" pad="26"/>
<connect gate="G$1" pin="IO1" pad="17"/>
<connect gate="G$1" pin="IO10" pad="22"/>
<connect gate="G$1" pin="IO11/MOSI" pad="6"/>
<connect gate="G$1" pin="IO12" pad="7"/>
<connect gate="G$1" pin="IO13" pad="23"/>
<connect gate="G$1" pin="IO14" pad="24"/>
<connect gate="G$1" pin="IO15/LED" pad="25"/>
<connect gate="G$1" pin="IO16" pad="11"/>
<connect gate="G$1" pin="IO17" pad="27"/>
<connect gate="G$1" pin="IO18/PU10K" pad="12"/>
<connect gate="G$1" pin="IO2" pad="18"/>
<connect gate="G$1" pin="IO21" pad="28"/>
<connect gate="G$1" pin="IO3" pad="2"/>
<connect gate="G$1" pin="IO33/SDA" pad="13"/>
<connect gate="G$1" pin="IO34" pad="29"/>
<connect gate="G$1" pin="IO35/SCL" pad="14"/>
<connect gate="G$1" pin="IO36" pad="30"/>
<connect gate="G$1" pin="IO37" pad="15"/>
<connect gate="G$1" pin="IO38" pad="31"/>
<connect gate="G$1" pin="IO39" pad="16"/>
<connect gate="G$1" pin="IO4" pad="19"/>
<connect gate="G$1" pin="IO40" pad="32"/>
<connect gate="G$1" pin="IO5" pad="3"/>
<connect gate="G$1" pin="IO6" pad="20"/>
<connect gate="G$1" pin="IO7/SCK" pad="4"/>
<connect gate="G$1" pin="IO8" pad="21"/>
<connect gate="G$1" pin="IO9/MISO" pad="5"/>
<connect gate="G$1" pin="VBUS" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CR_LM2596" prefix="U">
<description>Zhovee ‎KKK20 board with LM2596&lt;br&gt;

On Amazon: &lt;a href&gt;https://www.amazon.de/Stromversorgung-Spannungsregler-Abwärtswandler-Hocheffizienter-Einstellbares/dp/B07F38DJLS/&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="CR_LM2596" x="0" y="0"/>
</gates>
<devices>
<device name="" package="CR_LM2596">
<connects>
<connect gate="G$1" pin="GND@1" pad="2"/>
<connect gate="G$1" pin="GND@2" pad="3"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="POLLIN_JACK_A" prefix="X">
<description>Quellen:&lt;br&gt;
&lt;a href="https://www.pollin.de/productdownloads/D452316D.PDF"&gt;Pollin 452 316 (5.5/2.1mm)&lt;/a&gt;&lt;br&gt;
&lt;a href="&gt;https://www.pollin.de/productdownloads/D451810D.PDF"&gt;Pollin 451 810 (5.5/2.5mm)&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="POLLIN_JACK_A" x="0" y="0"/>
</gates>
<devices>
<device name="" package="POLLIN_JACK_A">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="FRAME1" library="frames" deviceset="A4L-LOC" device=""/>
<part name="U3" library="lib_s77_eggbot" deviceset="CARRIER_A4988" device=""/>
<part name="U2" library="lib_s77_eggbot" deviceset="S2_MINI" device=""/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="U1" library="lib_s77_eggbot" deviceset="CR_LM2596" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="U4" library="lib_s77_eggbot" deviceset="CARRIER_A4988" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="X1" library="lib_s77_eggbot" deviceset="POLLIN_JACK_A" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="38.1" y="132.08" size="1.778" layer="97">Achtung:
Ausgangsspannung auf 5V
einstellen, bevor die anderen
Module gesteckt werden!</text>
</plain>
<instances>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="U3" gate="G$1" x="187.96" y="116.84"/>
<instance part="U2" gate="G$1" x="111.76" y="55.88"/>
<instance part="GND1" gate="1" x="180.34" y="114.3"/>
<instance part="GND2" gate="1" x="104.14" y="53.34"/>
<instance part="U1" gate="G$1" x="38.1" y="149.86"/>
<instance part="GND3" gate="1" x="30.48" y="147.32"/>
<instance part="U4" gate="G$1" x="187.96" y="55.88"/>
<instance part="GND4" gate="1" x="180.34" y="53.34"/>
<instance part="X1" gate="G$1" x="30.48" y="76.2"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="104.14" y1="55.88" x2="104.14" y2="58.42" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="GND@1"/>
<wire x1="104.14" y1="58.42" x2="104.14" y2="60.96" width="0.1524" layer="91"/>
<wire x1="104.14" y1="60.96" x2="106.68" y2="60.96" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="GND@2"/>
<wire x1="106.68" y1="58.42" x2="104.14" y2="58.42" width="0.1524" layer="91"/>
<junction x="104.14" y="58.42"/>
</segment>
<segment>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="180.34" y1="116.84" x2="180.34" y2="119.38" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="GND@1"/>
<wire x1="180.34" y1="119.38" x2="180.34" y2="121.92" width="0.1524" layer="91"/>
<wire x1="180.34" y1="121.92" x2="182.88" y2="121.92" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="GND@2"/>
<wire x1="182.88" y1="119.38" x2="180.34" y2="119.38" width="0.1524" layer="91"/>
<junction x="180.34" y="119.38"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="GND@1"/>
<pinref part="GND4" gate="1" pin="GND"/>
<wire x1="182.88" y1="60.96" x2="180.34" y2="60.96" width="0.1524" layer="91"/>
<wire x1="180.34" y1="60.96" x2="180.34" y2="58.42" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="GND@2"/>
<wire x1="180.34" y1="58.42" x2="180.34" y2="55.88" width="0.1524" layer="91"/>
<wire x1="182.88" y1="58.42" x2="180.34" y2="58.42" width="0.1524" layer="91"/>
<junction x="180.34" y="58.42"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="GND@2"/>
<wire x1="33.02" y1="152.4" x2="30.48" y2="152.4" width="0.1524" layer="91"/>
<wire x1="30.48" y1="152.4" x2="30.48" y2="149.86" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="GND@1"/>
<wire x1="33.02" y1="154.94" x2="30.48" y2="154.94" width="0.1524" layer="91"/>
<wire x1="30.48" y1="154.94" x2="30.48" y2="152.4" width="0.1524" layer="91"/>
<junction x="30.48" y="152.4"/>
<pinref part="GND3" gate="1" pin="GND"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
</compatibility>
</eagle>
