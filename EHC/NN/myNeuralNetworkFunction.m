function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 19-May-2021 18:10:27.
%
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = Qx6 matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = Qx6 matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.831071551303105;-1.02912229954695;-0.908583096939375;0.504979766168889;-1.62308342372563;0.698079747338263];
x1_step1.gain = [3.80885290237046;1.91218861417949;1.59114840910637;2.11884616553418;3.69342299333373;1.59161897140598];
x1_step1.ymin = -1;

% Layer 1
b1 = [-4.0572141346619501334;-1.382397544942362666;2.105729250927367513;5.0841416175931763988;-1.0906939575292984301;-3.4680781030278566845;-2.1511983421155527196;-1.2498970443847610134;1.7492105617097419845;0.62125402841434407275;-1.8691133725112947239;2.1686321863762860751;-2.164149200110611293;-2.6169782104049770233;1.2855145025853242924;-4.1832740774738637057;0.46570829039967659435;1.993186714206249821;1.2238367074366818255;0.61601522120604546018;0.34171371180462128958;-0.82717832688915726713;0.019775247702871617816;-0.64653666980448398771;-1.3064404471451551704;-1.9781678622906815335;-1.001231611066798699;0.1001736379531729948;0.32503798720033078018;0.35637853988882972622;0.31719234116590555583;-0.33121542805219617023;-0.76678706711972488552;-1.8150221905756926954;-0.17627283775903737628;1.4870843533429225491;1.3656124931991160398;-1.1725244367642937426;-2.2447211179287087646;1.6479570300261090487;-0.086654370685094919691;2.8692960207285724827;4.3830774452406791042;1.5059822438548511325;-0.48995141723408447421;3.0911725341088969188;-0.85605259005634226632;-0.93189995532279312762;0.45087861032083526025;-5.3928202951108294982];
IW1_1 = [1.0992599187241327563 -1.0839367532825689988 -1.862265939720321839 -0.89158427617156366107 1.4596669094552889856 0.10174566715296884389;-1.7765701632679469224 -1.7395708912903078414 -1.2710954129788005762 -0.018419585878972959125 0.7925821457687008964 0.79373002487582255959;-2.3255303771977251515 -0.030535439901559296993 2.3674727565316615596 3.099397743175294373 -0.10129327251010281086 0.92109443406166913171;-0.15924975936783047903 -0.87698681456328586581 2.503592046055306497 -1.2485468833792068288 -0.67795508951799554609 -1.075962309404426831;-1.2970729585105771342 3.0664154625561996781 1.0689255643122015371 1.1557965069052715812 0.080467149555329575694 1.3797881674938048402;1.3687870774911758964 -0.1643572969962622532 0.89631330113114238145 2.6988933686067353435 2.4094206210071171803 -1.7078252942455183216;0.48840856225188788997 -1.992232936633696827 1.8567103380583100947 2.3544250816256528935 1.0240669359964651441 -0.75167029779852823079;1.3779547447913367275 0.43912723005586140612 1.0653658173073792259 -0.48320162601937355351 0.22339652804074022763 -1.983545375954208545;-2.049058391453662864 1.3385585429612179009 -0.19862297310111440285 0.48151845402818943542 -0.24980700730102189944 0.78340334918507137374;2.7812341000778615374 -2.1933880093983146864 0.72035712894692283115 -2.3173094497590529528 0.49396939573247272692 3.6800167182293410661;2.3233056513502075013 1.9868201109845375907 2.7348767273089760188 1.2367590633564420344 -0.75191748383520873311 0.19658960975690634165;-1.8232636826241075401 1.7899859068333052736 1.1395866801231786525 0.39020549233110030096 -2.0724634088509050756 -2.0193753646544347902;0.48033096168666500336 0.24834228369728619801 0.24682380004929702078 3.8950560353067897879 -0.57377252569271042226 -0.010716474378214324581;2.6522219536750126778 -2.6457687486242891239 -3.2731947702670400879 -0.93932508455463181729 1.3634633088988685756 -1.3098201394629698235;1.0564859263146262336 1.6348323559177682096 5.1002472048876565935 -1.5191664989178488288 1.8822937947055873309 -3.7823928487038669388;2.5347526000235913735 -2.5961728027620312176 -0.42581741275578782746 3.4960597012401315453 1.9177946179784337577 -0.58102508005512576439;-0.61987155546783956339 0.69225095558771987392 0.84449345637000350351 -0.50554645923758423365 -1.3731286824453341477 -0.59679454157034794726;-0.47677252882683185398 0.84237484665707684783 1.0431751011786032368 0.68103525877850312753 -0.59983122231027563576 -0.30407245529264198547;-0.23312491620092651301 -2.4289314814033713397 -2.6459057588593677401 0.82484032855916222804 -1.8609834017300763698 2.3376449499018128186;-1.1565722552333843609 1.054727829688535623 2.5087051083270135443 1.1756328193400120696 -2.6070783483685353588 -0.51932957955765857161;0.05787943302350634367 0.67605664290797173877 -0.55218280625847782073 -0.081860340758724656207 -0.87004181601847618843 -0.32936068170612925465;-0.62554648013068669954 -0.35357561186623631677 0.64193717881312450935 -0.92536202453104310361 -0.31721052532121446488 -2.7503064729588473369;0.11971654407085109695 -0.026700432496399407328 -2.4452827400628520671 -0.1419922567134223601 -1.2128401448769170479 0.66076779599698443057;0.46762931093538639971 0.21197601670164628596 -0.46594295572330579613 1.6031732398787368332 -0.19677779645335352621 -1.6265646775878508379;-1.0189658451773278003 -3.2302581728156622987 -2.1652020727894134566 2.2331465034370805434 1.6657608552479499231 0.82713949142082365817;1.9525052622938041669 2.3712011737290561442 2.7890034487883044179 0.68272037914679017945 0.92500505981841829595 -0.30143996268839318153;-2.2457160882088129661 -2.1631289610798427603 -2.6258668964385480926 3.2313343731444423845 1.3340624569476786654 0.67404955898940377423;2.4129936569580228145 1.7534300603827741583 2.2476333995974941971 -1.2579887778912266505 1.3359001853454002262 -2.7935744101214061708;-1.3370848710376710411 -0.1429106102873234363 2.0799633220612969708 1.7318968903846903018 -0.87098760317702639266 -1.6842969387416562022;0.007307088739340689143 0.75683441158301734131 0.79266939872465280725 0.014924914244841866462 -0.60660032796584384407 -0.70045321212910738318;-0.54120463536474716637 -4.2346269260157072267 0.41392623921391585862 -0.57172639024119453754 5.2503594774094350939 -3.9025707721099203162;-0.9987397563072740736 -0.22272296048468803731 0.71747753473522224432 -1.3841915704672973497 0.12922341201482356876 -3.2354787023277391533;2.6175350047135834686 -1.5122457418646810812 2.6464508057470252922 -1.1368752534365023088 2.9064922241865231989 -2.1360109450690405453;2.8843350240793403927 1.8879725610401674185 2.0016039043022986199 -1.4060651418449612304 1.9893571173732718105 -0.63942574752761738299;1.7617210211825427013 -2.1394456740593459365 -2.9875373375018927646 1.1945279388081928573 1.5411399473650861935 -0.29181966572163786644;3.7171620322856422369 1.7993579539629329656 0.7406574497237772281 -0.34118080684569440653 1.0482250988130672464 4.8156065661795146582;2.9117152120256277748 -3.4588642655567212181 2.0190582791477993396 -0.324900185145395759 0.10687728550758901491 0.36342037504000090919;-2.5335407164328964669 1.9564408969628670487 1.0667537262593327352 1.7097604785876814315 -1.8535506839042672489 4.3191065779804205249;-1.0089019144433621911 -1.7974618915024802579 -0.73748421652742379706 -0.43790856299817365604 0.27307332652138438522 -1.5156518665604243878;1.4476849003297842522 -2.1376637423929900628 0.97008164290662945994 -2.494964851851155796 1.5168561275546232903 2.7442591337295088039;0.6131673298466890909 0.72471974977003439378 1.6771698735659765767 -0.45611905128131091658 -0.24224623135638212457 -1.2680999582617011878;0.33922151906640940489 -0.39898030871811396292 2.1112101710758737205 3.2987772123943797098 2.2742242668064509559 0.48543742375860726712;1.3417309357471196574 2.118321808076720103 0.26390993973349702317 1.6233835624417558563 -0.080256975182024459237 -0.13850800822301811976;-0.15979598415555221202 -0.088849228007243194472 2.1567980368017369841 0.50738039275375745873 -0.27651617098269409833 0.15420027855184562093;0.51627141843448842717 -1.7998650180307838031 -1.5553084703841457692 -0.22643994830037911248 0.72966178350175459055 1.5594040588983777429;1.393218969706448318 1.2842812948707886811 -0.94912755530956527394 -1.1519237091983038912 0.96867810834814238596 1.0618242787373961544;-0.78524118775938644976 1.7948972139325669595 1.0550465633475782923 0.19067430704021764987 0.7828873982269816123 -1.1139087326851182524;0.34545574119510652489 0.11369547983393774038 -0.016825236036281304708 0.89874045881958397608 -0.770337115311222842 -0.73592546892221011312;0.11376543848767517453 -0.85635549578066949561 -0.66052864238803565833 0.13366108824179157022 0.64276121610823899744 0.84220923282255277798;2.4944707319503924836 -2.7734091351945253656 0.92372859013231811698 -1.7240774162007606041 0.72089444372231714642 2.2036489166541888274];

% Layer 2
b2 = [0.94119078929884480988;0.81804961852171154124;0.29519572784584169334;-0.18438842479395994856;-2.0693010566294165464;-0.93891503657970953878];
LW2_1 = [2.2933817848007329587 -1.2816677915391814224 -0.26828841271577918981 -0.19652357718125884611 -0.059473350308894612493 0.069472688952810834895 -0.37294691401549534548 -0.89562282849931329487 -1.0089415171643092428 -0.43716800969781999253 -0.38452636588224153869 -0.29065289981738867686 0.30481965016137940738 -0.16474851351942193523 -0.21947001194293025428 0.053740385950901144174 0.67128322591466116354 0.64078542206545829885 0.22799901275926304223 -0.56540207724441859938 2.9126558156207660311 -0.064367264728052625555 -1.4920050387365759725 0.4418114744642060443 0.44705361011963279383 0.59621753992077375361 -1.1373454329999355128 0.14061809926749396782 1.0866016519022489994 -3.7362153953591592526 0.15716091907580415077 -0.2269886879741348229 -0.15326825391284923383 0.062624699337765224461 -0.19251542374027569293 -0.14298639534325230382 -0.30153711255701415306 0.25954732378788275549 -0.22209866393119603867 0.16014679971973855288 -0.31314482780163044318 -0.07883770881547816356 -2.0387982884299922226 -0.41880339486003748117 -1.7901340712067288496 -0.71165297303264751783 -0.30563332205775317618 -0.43871780920377267954 2.0963447078353114605 -1.6308927410452442874;-2.9916405580260430064 0.13048045427970353383 8.1471464346803690315e-05 -0.32455592014526640776 -0.13958545550394563239 -0.083581629532673340499 0.34837074799185752116 -0.28814999703644822437 -0.24993624554034171714 -0.32597311404065099083 -0.33013786462695354773 -0.035205741560370845677 0.077691366266174261002 0.069883255161957452684 -0.27105567724430423837 -0.23562582995371522676 -0.28614334047264017302 0.055223309133352771472 0.47053998200136237795 0.43433361849494456219 0.6796843056388482962 -1.3105960284298387997 0.078356238083962109764 -0.47086703755101788627 -0.026350977920850771757 0.4752299537582899136 0.49525214631226255335 0.14708046841872410293 -0.35236757775799287806 -1.5520876827169676204 -0.14902048419062291496 0.9395236068738396229 0.42923454166168562018 -0.17186147539609339385 -0.11298078911848652428 -0.15960086407731483016 0.059404727038585750098 -0.066194335633167955546 0.0625277267738572895 0.389983303940596715 0.90370100871867931058 -0.28211874976265438608 -0.63470390651372576851 0.16736374106002113726 0.12528217094976423773 -3.9890211089286484736 0.67781953258561089548 0.12964287785513309292 -1.7149718688388391197 -2.5246470895286181602;2.065765216231693735 0.26343408269313101089 -0.005825954412543472849 0.16231966875887521295 0.12883906036452702493 0.088300793131677129955 -0.099122545440659431959 0.47202331044250300796 0.66221487239826914983 -0.03552769677031473311 0.034890639749176437234 -0.18846072569765873195 0.014009833668854474592 0.0063846717986564341385 -0.033505589165448511346 0.026059814472696025273 -0.28567247298761472285 -0.14652113999806493094 0.04941664928356551828 -0.077078128287387234763 0.41480892983618872227 0.62946969533942420671 -0.18581080627137080974 0.16661933572771708834 0.11556620046004728586 -0.063450844961075322792 -0.28077257666095989386 0.059245309128792875142 0.18626627446554200329 1.3539454047319043895 0.046046478986977799897 -0.41997212783250709167 -0.1649324558163134391 -0.074534511638780789888 0.15251761444087533204 0.11220905196650902969 0.026483205146457484275 0.029880070196709001412 -0.4955654388171984448 -0.097436695712976681416 0.21624199524684339924 0.033832670969930048188 0.014383228945655267272 0.056941629311583467909 0.7474575784209711582 0.97846341970554029377 0.39410110526094632721 -0.12724698838860590278 0.38771765588571693861 -0.46531549103437364057;0.68862943891511718686 -0.87047371034858178618 -0.19434859553387029418 0.34677740984479987763 0.12362123139346886669 -0.044854669908460605143 -0.30837365976179520466 -0.25931433804886278027 0.085477303017971795196 -0.50598394607041707882 -0.34688802700214282915 -0.4417086351702584901 0.20889692305068147116 -0.0011671188653271024824 -0.30251371582145436534 0.025106476545806159784 0.42422980149826600149 0.4671975631549352137 0.37755100910771005607 -0.3031726866566854528 2.5377050333442205954 -0.28813603976231411119 -1.1456912472613325349 0.27465327238400877308 0.47209972844269509906 0.60679795717174178638 -0.75839689578809488246 0.20070290504763185768 0.88688285573865033307 -1.8518534323193263091 0.11303653732973356627 -0.010893415677559241395 -0.08219880599625044304 -0.13935941559762912711 -0.020880428087360843742 -0.092127707737542668953 -0.23731601454239048543 0.15084359065827634971 -0.39189809744256887125 0.23207645640624763317 0.6295922677103098497 -0.22646566242836588256 -1.7720038407931664182 -0.34928885670143589026 -0.34845838674285489756 -1.919782541596298131 0.38788339586302222894 -0.40924141583769352293 1.6343922711124512226 -2.4090488886803447244;-0.53935666832369200119 0.58219858958223347223 0.20440456624825265042 0.65732091703932571392 0.10689172030240105815 -0.10436442195886197482 0.32639302079543647261 1.1112414392682532505 1.1635390102257507916 0.27457833833652767197 0.22011191234536778283 0.08248296387512835115 -0.20955381426708447057 0.13269117234784322257 0.063254192923719143593 -0.10940481016419179028 -0.72433115618322307938 1.2851610262746564484 -0.00086000771477730275638 0.50726436875143388061 -1.4515612113368911995 -0.36096715448889077349 1.0021266055816959728 -0.50671693996277655803 -0.1942379138288444218 -0.18570980037440892874 0.94937555938871065475 -0.015819032576267842705 -0.84775657305793694629 1.7352043854496423947 -0.13245755008811288533 0.27143224957247530371 0.16588634434534552109 -0.29254376751632071851 0.15525039780265681433 0.0023425160770959227441 0.23520552670374555992 -0.17588779482096919549 -0.19570189832581919021 0.027533802131903942212 1.0249731529266761232 -0.041473939039009803664 1.8333640250922667025 -0.017844054324505406739 1.4276769241486901851 -0.15495045358602835273 0.54889297170050899144 0.43363517836318232757 -2.1826113588205280358 -0.10410454218821776906;0.15544609923790517203 -0.44575106443514567189 0.13592194556341449796 -0.49725604010353702256 -0.1668593187521385246 -0.033973837720255445349 -0.022327909243749305412 -0.55442259660028847534 -0.98303081793688473766 0.52047672966324942667 0.38572943653607039138 0.60498605945352368352 -0.19953378922390879735 -0.084901926800701729703 0.37381152168941833569 0.16573494146328304755 0.49968024136316824269 0.62372264695361934184 -0.61812819455578493777 -0.13640877954641578151 -2.289997187551124469 0.067346950113058384746 0.67486218271221498632 -0.035670284283171593831 -0.36320705819104365242 -0.51827428157494570549 0.31188253846041136264 -0.28263733121864287323 -0.38852686118212120814 -0.64689938738905561344 0.012930457760057544048 -0.016133503688408393217 -0.052461294342226280629 0.35046332889855735804 -0.27608100122368078866 -0.044903927568980664398 0.066626168968012142169 -0.057977631662910207588 0.88035381287275826789 -0.26881073861234799915 -1.3082080507592972474 0.3078101276597200453 1.844477951802236948 -0.25907780569707872242 -1.3225634059852646729 2.8755465262047810171 -1.386559512466080557 0.41257232973684093702 -0.083668055361710153006 3.6736314176150450805];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.0125244466045609;0.0112854889680589;0.00608453788238976;0.0110279407599633;0.0129305888897699;0.0107895081206502];
y1_step1.xoffset = [-99.2959054602061;-65.3665134918921;-231.644082175037;-124.740567386561;-95.7554980745234;-56.4844135533038];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
    X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},1); % samples/series
else
    Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Input 1
    X{1,ts} = X{1,ts}';
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
    Y{1,ts} = Y{1,ts}';
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
    Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end