
_MAT.mac and _MAT2.mac contain Standard Material Properties. There are two files to accomidate different ways of doing things. The numbering scheme is shared for both files and is located below.

Please Take care not to use a materials number in _MAT.mac or _MAT2.mac that is listed here or is already in _MAT.mac or _MAT2.mac

Use _MAT.mac and _MAT2.mac in the same way:
_MAT(2),<Standard Material Number>,<Number Assingment> 

  Material Number List
====================================================

 802 -> Aluminum 7075-T73
 803 -> Titanium Ti-6Al-4V
 804 -> Stainless Steel A286
 805 -> Aluminum 6061-T651
 806 -> Stainless Steel 15-5 PH
 807 -> G10 (XY/Z) Orthotropic
 808 -> HYSOL EA9394
 809 -> MS1A (52% FV) Min Properties
 820 -> _MAT2 Example Material
 821 -> _MAT2 Example Material
-- 830 - 849 : Reserved For HEXCEL HPR
 831 -> Hexcel HRP – 3/16 – 5.5 pcf
-- 850 - 870 : Reserved For Composites
 850 -> M55J Historical Minimum
 854 -> YSH70 : Historical SAM
 855 -> S2 Glass/Epoxy Unidirectional Facesheet
-- 871 - 892 : Reserved For HEXCEL 5056
 873 -> Hexcel 1/8  – 5056 – .001,  4.5pcf
 876 -> Hexcel 5/32 – 5056 – .0007, 2.6pcf
 877 -> Hexcel 5/32 – 5056 – .001
 884 -> Hexcel 1/4  – 5056 – .0007, 1.6pcf
 889 -> Hexcel 3/8  – 5056 – .0007, 1.0pcf
 899 -> Reserved for _MAT.mac

TMI (Too Much Information)
=====================================================
_MAT2.mac actually wraps _MAT.mac it does by calling _MAT.mac if it can not find a property in _MAT2.mac. This is done so that data is not duplicated from one file to the next.

 HOW TO USE PROPERTIES W/O MACROS
=====================================================

1) Copy parameter assingments from _MAT.mac into your material file ie for aluminum

MatName = 'Aluminum 7075-T73'
ref     = 'MIL-HDBK-5E'
E11     = 10.3e6*psi
rho     = 0.1*lbm/in**3
cteX    = 12.4E-6/degF
PR12    = 0.33

Either delete units or assign them correctly.

2) Copy This Generic Material Propety

MNum = <#>
MP,EX,MNum,E11    !Modulus
MP,EY,MNum,E22
MP,EZ,MNum,E33

MP,prxy,MNum,PR12  !Poison's Ratio
MP,prxz,MNum,PR13
MP,pryz,MNum,PR23

MP,gxy,MNum,G12    !Shear 
MP,gxz,MNum,G13
MP,gyz,MNum,G23   

MP,DENS,MNum,rho
MP,ALPX,MNum,cteX

3) Delete lines in generic material property that you don't need, so we would be left with something like:

psi = 1
lbm = 1/386.09
degF = 1

E11     = 10.3e6*psi
rho     = 0.1*lbm/in**3
cteX    = 12.4E-6/degF
PR12    = 0.33

MNum = <#>
MP,EX,MNum,E11    !Modulus
MP,prxy,MNum,PR12  !Poison's Ratio
MP,DENS,MNum,rho
MP,ALPX,MNum,cteX

4) Was that really so hard?