--------------------------------------------------------------------------------
-- NPC Name: Olokwa                                                      None --
-- NPC Job:  ambiente                                                         --
--                                                                            --
-- NPC Race: orc                        NPC Position:  392, 178, -6           --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: October 10, 2010                        easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 392, 178, -6, 4, 'Olokwa', 'npc.olokwa', 0, 2, 3, 244, 244, 234, 137, 123, 60);
---]]


require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.condition.state")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.money")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.olokwa", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stop");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hrm, mirr soll erz�hlen etwas anderes?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stop");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hrm, mes should tell anoter tale?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addResponse("Wich tale mes should tell?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addResponse("welche Geschichte %NPC, soll erz�hlen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ancestor");
talkEntry:addTrigger("ancestry");
talkEntry:addTrigger("forefather");
talkEntry:addResponse("Should mes tell 'tale about'- Cherga, Chief Veralion, Kaja Wolfagen, Gabon Corad, Kurga Wolfbane, Warlord Retlak, General Grivijak, Borgrud or Chief Rugh'toh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ahnen");
talkEntry:addTrigger("vorfahren");
talkEntry:addResponse("%NPCNAME soll berichten 'Erz�hlung von' - Cherga, Chief Veralion, Kaja Wolfagen, Gabon Corad, Kurga Wolfbane, Warlord Retlak, General Grivijak, Borgrud oder Chief Rugh'toh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tale chief veralion");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Chief Veralion was one of the first chiefs and founding fathers of the original clan. Under his reign, the clan saw it's most prosperous and productive years...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("...His efforts helped keep the clan together in times both thick and thin. In life, he was honorable, well respected by fellow clansmen, and revered as a great savior of our kin. Rest in peace, old friend.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erz[a�]hl chief veralion");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erz�hlung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Chief  Veralion einer der Ersten war. Gr�ndervater von erste Klan, Stamm von Orks.  Unter  seiner Herrschaft, Stamm erlebt gedeihende und gro�artige Jahre...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("...Er hielt Br�der und Schwester zusammen, stehen gemeinsam durch dick und d�nn Dunkelste Zeit �ber Gobaith kam, doch Veralion gegangen gloreichste Pfade. Sein Leben ehernhaftest war, doch nun er schon lange ruht in Land der Ahnen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tale Kaja Wolfagen");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Kaja Wolfagen was one of the greatest Shamans to ever live on the island of Gobaith. His teachings of our father installed great knowledge...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("...into the clansmen of the time. Many looked up to this orc with great respect. He had seen much in his days of life, which clearly showed in his ragged old form...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addResponse("...During the Northerot wars, his magics helped create a lasting impression of power and glory for the clan.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erz[a�]hl Kaja Wolfagen");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erz�hlung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Kaja Wolfagen einer von gr��te Schamanen war, welcher je gelebt auf Insel Gobaith. Er gelehrt sein Br�der und Schwestern gro�es Wissen �ber unser aller Vater...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 7));
talkEntry:addResponse("...Ungez�hlte sahen auf zu diesem m�chtigen Ork, mit gr��tem Respekt. Im  Northerot-Krieg, seine �berlegenen Zauber kreieren einen bleibenden Abdruck von Kraft und Ruhm unseres Stammes.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tale Gabon Corad");
talkEntry:addResponse("Gabon Corad maintained the Clan until Warrior Queen Kurga Wolfbane assumed control of the Clan as it�s first �chiefess�. He currently serves as Red Skull as the eldest and most respected Bloodskull.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erz[a�]hl Gabon Corad");
talkEntry:addResponse("Gabon Corad beaufsichtigte den Klan als Kriegerk�nigin Kurga Wolfbane als erstes Weib Stammesanf�hrerin wurde. Nun er hat den Rank eines Rotsch�dels! Er �lteste und mei�t respektierter Bloodskull!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tale Kurga Wolfbane");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Warrior Queen Kurga Wolfbane, murdered by a clanman known as Zub. She was betraid and ambushed by Zub and several humans and elves...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 8));
talkEntry:addResponse("...Under her short term leadership, the Orc Cave was expanded and Orcs recruited. May she rest well with the greatest honor an orc can recieve.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erz[a�]hl Kurga Wolfbane");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erz�hlung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Kriegerk�nigin Kurga Wolfbane, ermordet wurde von Klanbruder �Zub�. Er verraten hat Kurga, and Menschen und Elfen, in Hinterhalt...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 8));
talkEntry:addResponse("...Auch wenn Herrschaft nur kurz, sie gegraben neue Kammern in H�hle und aufgenommen viele junge Orks. Ihre Knochen sollen erfahren gr��te Ehre, einem Ork m�glich ist.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tale warlord retlak");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Warlord Retlak! His name stood for the strength and superiority of the Orcs. His name was mentioned with respect by Orcs and spoken with fear by others...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 9));
talkEntry:addResponse("...All beings of the human town as well as the desert town hold their breath when the Warlord entered the gates. The warlord lived for many, many years on the island...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 10));
talkEntry:addResponse("...He fought side on side with Gabon Corad and Gort called 'Crunk'. Even today many people will remember the warlord's name, even many years after his death. The Orcs honor Retlak during his live.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erz[a�]hl Warlord Retlak");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erz�hlung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Kriegsherr Retlak! Dieser Name steht f�r St�rke und �berlegenheit von Orks. Dieser Name ausgesprochen in Respekt von Orks und in Angst von anderen...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 9));
talkEntry:addResponse("...Jeder, in Menzchen-Stadt und W�sten-Stadt angehalten Atem, wenn Retlak treten durch Tore. Viele Jahre er gelebt auf Insel Gobaith...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 10));
talkEntry:addResponse("...K�mpfen Seite an Seite mit Gabon Corad, und Gort, genannt �Crunk�. Auch zu Tage heutig noch, viele Leute erinnern an Name von dem Kriegsherren...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 11));
talkEntry:addResponse("...Auch wenn viel Zeit vergangen seit sein Tod. Alle Orks ehren sollen Retlak f�r sein Leben.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tale General Grivijak");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("General Grivijak! Compared to the warlord Retlak, General Grivijak lived on Gobaith for a quite short time only. However, in his given time...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 12));
talkEntry:addResponse("...he became the strongest warrior of the whole island. He used his strength and wisdom to unite the Orcs with help of Gabon Corad. There are rumors about his disappearnce...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 13));
talkEntry:addResponse("...Some say he just left the island. Others say a horde of mighty demon beasts were able to strike him down with help of magic.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erz[a�]hlGeneral Grivijak");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erz�hlung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("General Grivijak! Verglichen mit Kriegsherr Retlak, Grivijak gelebt f�r kruze Zeit auf Gobaith. Falls-jeden er war...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 12));
talkEntry:addResponse("...st�rkster Krieger auf ganze Insel. Mit sein St�rke und Klugheit er geeint und gesammelt den Stamm der Orks, gemeinsam mit Gabon Corad. �ber sein verschwinden Ger�chte wild...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 13));
talkEntry:addResponse("...Einer sagt er gereist auf gro�er Kontinent. Anderer sagt, m�chtige d�monische Bestien ihn umgebracht mit magische Hilfe.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tale Borgrud");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Borgrud, called Bor, was a loyal warrior of great strength, who was surrounded and attacked by the cowardly humans of Trollsbane...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 14));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 14));
talkEntry:addResponse("...They bound him with ropes, but he broke free, and shouting his last word 'FREE!' charged into them. He was killed that day, infront of his own daughter Krebla's eyes...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 15));
talkEntry:addResponse("...His example shows that the orcs cannot be held down, and after the horde spilled the blood of his murderers on the city streets we gained the respect and fear that the orcs deserve.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erz[a�]hl Borgrud");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erz�hlung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Borgrud, genannt Bor, loyaler m�chtiger Krieger war. Er eingekreist von feige Menzchen von Trollsbane, versklaven sie wollten ihn...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 14));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 14));
talkEntry:addResponse("...Sie fesselten ihn mit Seilen, doch er zerri� sie! Er br�llt 'FREE!', und dann ermordet wird vor Augen seine Tochter Krebla. Sein Heldenmut zeigen da� Orks dienen niemand...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 15));
talkEntry:addResponse("...besonders nach dem der Klan das Blut seiner M�rder �ber die Stra�en der Stadt verteilt getan hat. Hurr!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tale Rugh toh");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Chief Rugh�toh is a true Orcen Hero. Warrior, Lokh�um and brother...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 16));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 16));
talkEntry:addResponse("...In failure and Victory, he was a true Orc. He fought against the Grey Refuge and spent a year in jail due to human betrayal...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 17));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 17));
talkEntry:addResponse("...He reformed the Orc Clan up from the ashes of the bloodskulls and created the largest clan known, the Dark'rest Clan. He expanded the cave defenses with the building of the Gates...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 18));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 18));
talkEntry:addResponse("...And the Hall of Ancestors was built under his reign as well as the Jail. Then the Klan was able to fought a stunning victory against the dwarves of Silverbrandt after a year long war, under his leadership.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erz[a�]hl Rugh toh");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erz�hlung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Chief Rugh�toh ein wahrer Held ist. Krieger, Lokh�um und Bruder...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 16));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 16));
talkEntry:addResponse("...Im Fehl und Sieg, er wahrer Ork war. Er k�mpfte Graue Brug, verbracht ein Jahr in Gefangenschaft. Dann  er erneuern Klan aus Asche der Bloodskulls...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 17));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 17));
talkEntry:addResponse("...Es der gr��te Klan war, man wei� von! Der Klan vom Berg Dark�rest. Rugh gebaut m�chtige Tore von Orkh�hle, Halle der Ahnen und Kerker!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 18));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 18));
talkEntry:addResponse("...Dann der Klan errungen glorreicher Sieg �ber Zwerge von Silberbrandt, nach Jahre langen Krieg unter seinem Befehl.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ic witch");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Cherga, the icy witch! Escorts the dead through the nothing, the eternal rift between the worlds, into the land of the ancestors. If an orc has defeated many enemies in battle and was strong in his lifetime...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("...his reputation there will be vast, and his ancestors will honor him. He will have many servants and slaves, and the woman will love him....");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("...If he was weak and cowardly, he will spend his time there as a servant, perhaps even as a servant of a human, halfling, or dwarf.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Cherga, the icy witch! Escorts the dead through the nothing, the eternal rift between the worlds, into the land of the ancestors. If an orc has defeated many enemies in battle and was strong in his lifetime...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eis Hex");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erz�hlung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Cherga, die eisige Hexe! F�hrt die Toten durch das Nichts, die ewige Kluft zwischen den Welten, in das Land der Ahnen. Wenn ein Ork viele Gegner im Kampf besiegt hat und in seinem Leben stark war...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erz�hlung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Cherga, die eisige Hexe! F�hrt die Toten durch das Nichts, die ewige Kluft zwischen den Welten, in das Land der Ahnen. Wenn ein Ork viele Gegner im Kampf besiegt hat und in seinem Leben stark war...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("...ist sein Ansehen dort gro�, und seine Ahnen werden ihn ehren. Er bekommt viele Diener und Sklaven, und die Frauen werden ihn lieben...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("...War er schwach und feige, so wird er dort ein Dasein als Diener fristen m�ssen, wohlm�glich gar als Diener eines Menschen, Halblings oder Zwergen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("seek advice");
talkEntry:addCondition(npc.base.condition.money.money("=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(314, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", "=>", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("The old orc takes the Items from you, now he seems ready to answer you any question."));
talkEntry:addResponse("Hurr. Giv me the stuff... and now ask your question to tha ancestors.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(63, 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(314, 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3051, 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".");
talkEntry:addTrigger("?");
talkEntry:addTrigger("!");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The ancestors prophesy! The one with fire in head will need your help.");
talkEntry:addResponse("Don't trust tha bearer of fur! Your ancintors advice...");
talkEntry:addResponse("They shout! Tha forefathers yell... 'Don't open! Never...'");
talkEntry:addResponse("Your ancestors  say: 'Don't catch a cold and put some warm on!'");
talkEntry:addResponse("Hurr, all easy going today. Nub worry!");
talkEntry:addResponse("Yubba! There it is! Mes see 'ha sign of Axe! Be careful.");
talkEntry:addResponse("Yubba! There it is! Mes see 'ha sign of black hound! Stay with your friends and brothers.");
talkEntry:addResponse("Yubba! There it is! Mes see 'ha sign of broken Bone...sharpening your blade!");
talkEntry:addResponse("Yubba! There it is! Mes see 'ha sign of bloody skull. You should gather food. Yubba.");
talkEntry:addResponse("Yubba! There it is! Mes see 'ha sign of rolling Stone. That means this will be a good day for you!");
talkEntry:addResponse("Yubba! There it is! Mes see 'ha sign of white wolf. Good time for hunting.");
talkEntry:addResponse("Yubba! There it is! Mes see 'ha sign of big tooth. Hold eye open, watch up! Especially during sleeping.");
talkEntry:addResponse("Uh! There is lot of Trouble, waiting for your green butt...");
talkEntry:addResponse("Follow the rabbit. Knock-Knock...");
talkEntry:addResponse("Shiny armory! Youbba be in the middle! Carefull now.");
talkEntry:addResponse("Deep drums in the deep. Mes hearing drums!");
talkEntry:addResponse("Don't get stabbed by those horns...!!");
talkEntry:addResponse("Follow youbba nose! Is good.");
talkEntry:addResponse("There one will be! Leading this Tribe! Glorious day come! Honorable Battle! ...maybes you...maybee.");
talkEntry:addResponse("%NPCNAME saw youbba die!... be brave and it 'll be heroic. Yes!");
talkEntry:addResponse("Blood! ebbrywere Blood. it's yopurs! A true friend shall save you.");
talkEntry:addResponse("Beware tha giant club!");
talkEntry:addResponse("#me chukles. 'Youbba 'll see!'");
talkEntry:addResponse("#me grunts. 'Thuus one it better, if you don't know!'");
talkEntry:addResponse("Har, har! Youbba in deep, deep mudd this time!");
talkEntry:addResponse("Better take a axe with you... when youbba leavin.");
talkEntry:addResponse("The one, close to you, need youb adivce.");
talkEntry:addResponse("Praise your father! Hurry up.");
talkEntry:addResponse("Your future is foggy!%NPCNAME can't see... only father knows tha true answer!");
talkEntry:addResponse("You forgot something importent.");
talkEntry:addResponse("Your keys in youbba bag, ib you should search those again....");
talkEntry:addResponse("There undone things to finnish, before make further steps.");
talkEntry:addResponse("There two ways. You have tho choose... take the stoney one.");
talkEntry:addResponse("Tha ancestors just dinning. Ask lather again.");
talkEntry:addResponse("Tha ancestors busy with importent ancestor-stuff. Nub interupt with your foolish questions!");
talkEntry:addResponse("Tha big claw be smarter than you think.");
talkEntry:addResponse("Tha pointed teeth became rusty.");
talkEntry:addResponse("One will come and change youbba live! Is good is bad? Who knows...");
talkEntry:addResponse("Schut tha damn gate ib youb walking trough!");
talkEntry:addResponse("Tha raw meat isn't well done yet.");
talkEntry:addResponse("Stone 'll break. Wood'll root. Bone 'll slpash.");
talkEntry:addResponse("Sum litte need your eye just a sekond. And youbba nub see it.");
talkEntry:addResponse("Tha migthy horn ob battle sounds over the mountain!");
talkEntry:addResponse("Ib youbba wanna be successful, put youbba shoes down.");
talkEntry:addResponse("Don't care about the Oomie's words.");
talkEntry:addResponse("In general an' whole in whole... tha answer for all your questions is fourtytwo!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("seek advice");
talkEntry:addResponse("Indee! But the advice of mine and tha ancestors 'll need two coppercoins! Entrails and ashes from a campfire... uhm 'nd yes, yes a sousage also be needed, he he!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("suche rat");
talkEntry:addCondition(npc.base.condition.money.money("=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(314, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", "=>", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Der alte Ork nimmt die Gegenst�nde von dir und scheint nun bereit dir eine beliebige Frage zu beantworten."));
talkEntry:addResponse("Hurr. Gibb mir das Zeug... und stellen jetzt deine Frage an Vorfahren.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(63, 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(314, 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3051, 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".");
talkEntry:addTrigger("?");
talkEntry:addTrigger("!");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Die Ahnen Prophezeien... 'Jener mit Feuer am Haupte, wird deine Hilfe brauchen!'");
talkEntry:addResponse("Nicht Vertraue, den Tr�ger von Fellen. Die Vorfahren raten es dir...");
talkEntry:addResponse("Sie schreien! Die Vorfahren rufen... 'Nicht �ffnen! Niemals...'");
talkEntry:addResponse("Hurr, alles gutt. Heute geht leicht und m�helos!");
talkEntry:addResponse("Yubba! Da es ist, Mir sieht 's Zeichen von Axt! Sei vorsichtig.");
talkEntry:addResponse("Yubba! Da es ist, Mir sieht 's Zeichen von scharzen Hound! Bleib bei dein Freunde und unter Br�dern.");
talkEntry:addResponse("Yubba! Da es ist, Mir sieht 's Zeichen von gebrochen Knochen! Schleifen dein Klingen scharf, jetzt.");
talkEntry:addResponse("Yubba! Da es ist, Mir sieht 's Zeichen von blutig Sch�del. Du solltest sammeln Vorr�te, yubba.");
talkEntry:addResponse("Yubba! Da es ist, Mir sieht 's Zeichen von rollende Steine. Das bedeuten, es wird guter Tag f�r dirr.");
talkEntry:addResponse("Yubba! Da es ist, Mir sieht 's Zeichen von wei�er Wolf. Gute Zeit zu Jagen ist jetzt.");
talkEntry:addResponse("Yubba! Da es ist, Mir sieht 's Zeichen von gro�en Zahn. Halte Auge offen, aufpassen! Gerade wenn du schl�fst.");
talkEntry:addResponse("Uh! Mirr sehe viel �rger.. warten auf dein gr�nen Hintern.");
talkEntry:addResponse("Folge dem Hasen. Knock-Knock...");
talkEntry:addResponse("Gl�nzig R�stung! DU bist mittig drinnen. Vorsicht jetzt!");
talkEntry:addResponse("Trommeln... Trommeln in der Tiefe. Olokwa kann sie h�hren.");
talkEntry:addResponse("Stossen dir nix dein Kopf an Decke von Tunnel.");
talkEntry:addResponse("Folgen dein Nase. Das gut.");
talkEntry:addResponse("Einer wird kommen! Diesen Stamm f�hren. Glorreich Tag kommt. Ehrenreiche Schlacht!... vieleicht du jener bist...vielleicht.");
talkEntry:addResponse("%NPCNAME hat gesehen, %CHARNAME's Tot. Mut, wenn du bist mutig, es werden heldenhaft. Ja.");
talkEntry:addResponse("Blut! Blut �berall. Deines es ist. Ein waherer Freund soll dich retten.");
talkEntry:addResponse("Pass auf die gro�e Keule auf!");
talkEntry:addResponse("#me lacht hei�er. 'Du schon sehen wirst!'");
talkEntry:addResponse("#me grunzt. 'Dieses jene du besser niemals wissen wirst.'");
talkEntry:addResponse("Besser du nimmst mit, Axt. Wenn du gehst.");
talkEntry:addResponse("Jener, dir Nahe ist. Brauchen dein Begleitung.");
talkEntry:addResponse("Ehre den Vater! Eilen du dich sollst!");
talkEntry:addResponse("Dein Zukunft in nebel versunken ist. Olokwa nicht sieht, nur Vater kennt wahre Antwort.");
talkEntry:addResponse("Du vergessen, etwas von wichtigkeit hast!");
talkEntry:addResponse("Dein Schl�ssel in dein Tasche sind, falls du sie suchen solltest wieder...");
talkEntry:addResponse("Es unvollbrachte Taten gibt. es an dir sie zu gehen, bevor machen neue Schritte.");
talkEntry:addResponse("Dort sind zwei Wege. Du w�hlen musst... nehme den Steinigen.");
talkEntry:addResponse("Die Ahnen gerade Essen, du fragst sp�ter wieder.");
talkEntry:addResponse("Die Ahnen besch�ftigt mit wichtig Ahnen-Sache. Du nicht unterbrichst mit deine dumme Fragen!");
talkEntry:addResponse("Die gro�e Kralle kl�ger ist als du glauben.");
talkEntry:addResponse("Der spitze Zahn wird rostitg.");
talkEntry:addResponse("Jemand kommen wird und �ndern dein Leben. Ist gut,  ist schlecht? Wer wei�...");
talkEntry:addResponse("Schmei�en das verdammte Tor zu! Wenn gehen durch!!");
talkEntry:addResponse("Stein brechen wird. Holz morschen wird. Knochn splittern wird.");
talkEntry:addResponse("Etwas, sehr klein. Deinen Blick braucht, nur einen Moment. Aber du nicht siehst.");
talkEntry:addResponse("M�chtiges Horn von Schlacht dr�hnt �ber Berg!");
talkEntry:addResponse("Wenn du Erfolg willst, du ausziehst dein Schuhe aus.");
talkEntry:addResponse("Du nicht h�rst auf die Worte von Oomie.");
talkEntry:addResponse("Im Allgemein und �berhaupt... alles in alle die Antwort auf alle dein Frage ist Zweiundvierzig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("suche rat");
talkEntry:addResponse("T�rlich! Aber Rat von Ahnen und mirr braucht Kupferm�nzen... zwei! Ged�rm und Asche von Lagerfeuer... uhm 'nd ja, ja ne Wurst brauchen wir auch, he he!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addTrigger("gr[�ue]+[s�]+e");
talkEntry:addTrigger("guten tag");
talkEntry:addTrigger("Gru�");
talkEntry:addTrigger("Seid gegr��t");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Greb");
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Greebs.. suchst du Rat? Tust du?");
talkEntry:addResponse("#me's Augen sind verbunden, dennoch dreht er den Kopf in deine Richtung. '%CHARNAME...'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good day");
talkEntry:addTrigger("greetings");
talkEntry:addTrigger("greets");
talkEntry:addTrigger("hail");
talkEntry:addTrigger("hello");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Good morning");
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Greebs.. seeking advice, do you?");
talkEntry:addResponse("#me wears a blindfold. Altough he truns his head to you. '%CHARNAME...'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Greebs.. seeking advice, do you?");
talkEntry:addResponse("#me wears a blindfold. Altough he truns his head to you. '%CHARNAME...'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Greebs.. suchst du Rat? Tust du?");
talkEntry:addResponse("#me's Augen sind verbunden, dennoch dreht er den Kopf in deine Richtung. '%CHARNAME...'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[s�]+t du");
talkEntry:addTrigger("wie hei[s�]+t ihr");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer seid");
talkEntry:addTrigger("wer bist");
talkEntry:addResponse("Mein Name, Olokwa ist! Mein Auge nur D�sterniss und Schw�rze sieht, trozdem Olokwa sieht mehr, als alle Anderen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farebas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tsch��");
talkEntry:addTrigger("Tsch�ss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Farebas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Fareba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farebas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Fareba");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Farebas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Nott important! Better think ob you ancestors. Care!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie f�hlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Nicht, gar wichtig. Besser denke an deine Ahnen. K�mmere!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name, Olokwa is! My Eye only see black and murk, although Olokwa see more than every other. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("I'm");
talkEntry:addResponse("Olokwa know! Mes know you true Name! Mes saw... your ancientors told me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("Olokwa wei�! Mirr wissen dein wahre Name. Gesehn... dein Ahnen gesagt mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("Frage Olokwa nach Geschichte von 'Ahnen' oder 'suche Rat'.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addResponse("Frage Olokwa nach Geschichte von 'Ahnen' oder'suche Rat'.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("Ask Olokwa for tale about 'ancestor', or 'seek advice'.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("aug");
talkEntry:addTrigger("auge");
talkEntry:addTrigger("augenbinde");
talkEntry:addResponse("Olokwa's Augen sind tot... Aber er h�rt die Stimmen der Ahnen. Er befragt die Knochen! Er sieht die eisige Hexe in seinen Tr�umen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("blind");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Olokwa's Augen sind tot... Aber er h�rt die Stimmen der Ahnen. Er befragt die Knochen! Er sieht die eisige Hexe in seinen Tr�umen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("blind");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Olokwa's eyes dead... But he hear tha voice of ancestors. He quizes the bones. He see tha icy witch in his dreams!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eye");
talkEntry:addTrigger("blindfold");
talkEntry:addResponse("Olokwa's eyes dead... But he hear tha voice of ancestors. He quizes the bones. He see tha icy witch in his dreams!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("jag");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr! Jag m�chtig ist viel! Nahe bei Chief 'nd Warlord!");
talkEntry:addResponse("Hurr... Jag seine m�chtige Redskull! Und Kampfmeista von derr Klan. Wenn du lerne wolle, zerhauen Zeug? Gehe zu Jag!");
talkEntry:addResponse("Jag zermatscht alle Oomies bei gro�e Turnier, wie W�rma. hehe!");
talkEntry:addResponse("Bruddha Jag? Hurr... Mirr erinnere Tag von Green-Growl! Uh! Vatha gemocht das hat! Wirr sollte feiern diese Tag.");
talkEntry:addResponse("#me h�lt sich den Kopf: ' Du nix hammern dein Sch�dl gegen Jags Keule!'");
talkEntry:addResponse("Jag hart lustig Sammlung. Har-har! DU fragst Jag.");
talkEntry:addResponse("Jag mag Fleisch. Er imma hunger. hehe!");
talkEntry:addResponse("Jag schnelle, strak Kriega! F�r Vatha, f�r Klan!");
talkEntry:addResponse("Jag? Hurr! Mir denkt er suchen neue Spitzohren tut.");
talkEntry:addResponse("Jag? Hurr! Du nix spreche schlecht uber Murgo, wenn er h�rt. Sonst er zermatsch dein Fresse! Har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("jag");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr! Jag berreh mighte beh! Almost like dah Chiefeh and dah Warlord!");
talkEntry:addResponse("Hurr... Jag be mighte Red Skull and Drillmasta ob dha Clan! Ib yoo want learn smashing stuff, ask Jag!");
talkEntry:addResponse("Jag smashed all dah Ommies in dah big tournamant, dhus Jag beh First Smasha!");
talkEntry:addResponse("Broddha Jag? Hurr... Meh get dah Day ob Green Growl in mind. Dhat beh slaughta beh! Hurr! Dha Faddha like dhat! Yoo should celebrate dhat day!");
talkEntry:addResponse("#me holds his head: 'Avoid to feel Jag's maces at yoor head!'");
talkEntry:addResponse("Jag hub berreh nice collection, hurr!");
talkEntry:addResponse("Look for meat and bring dhat Jag! Jag beh alwaehs hungreh.");
talkEntry:addResponse("Jag beh proud and honorfull redskull, hurr!");
talkEntry:addResponse("Jag beh fast and strong warrior for dah Fadha and dha Clan!");
talkEntry:addResponse("Jag? Hurr! Mee thinks Jag beh looking for nuw Longears!");
talkEntry:addResponse("Jag? Hurr! Nub speak bad about dah Lok'uhm Murgo in front ob Jag. Jag smash yoor fais odhawise!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krazen");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Krazen nix kl�gster Ork ist. 'r geschmissn aus alte Stamm, alsgez�ndet Mantel von Chief, mit Feua!");
talkEntry:addResponse("Krazen? Er diese dumme Feua-macha, yubba?");
talkEntry:addResponse("Hur hur... du geh�rt? Krazen nix darf in Borgates Taverne mehr gehn. Er Verbot.");
talkEntry:addResponse("Yubba, Krazen EIN Freund hat. Ist Grimghor.");
talkEntry:addResponse("Du sollten Fragn, Krazen tanzt furr dirr. Ist gro�e Spass, sehen dars!");
talkEntry:addResponse("Yub.. er gross, tragen verdammtes gutt Helm, schmutzig gr�n Robe. Uh? yubba.. er stinken.");
talkEntry:addResponse("Krazen nie gewesen gutte Kriega. Aba Kopf imma stecken �berall drin...");
talkEntry:addResponse("Krazen gutte Ork ist, mir galubt. Du nur nix blicken in seine Augen. NIx starren ihn an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krazen");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Krazen nub da smartest orc meh see...'e was kick'd frum his own tribe-set the chiefess clothes on fire!");
talkEntry:addResponse("Krazen? He beh dat stoopid firestarter, yubba?");
talkEntry:addResponse("Hur hur...y'hear? Krazen nub allowed in Borgate's tavern no more...");
talkEntry:addResponse("Yubba, Krazen hab a friend named Grimghor. Meh fink it's his only one.");
talkEntry:addResponse("Yub! You shuld ask Krazen to do a dance fer ya! Funny as hell!");
talkEntry:addResponse("Yub...he's tall, wears dis damn awful metal hat, dirty green robe...Yar, dat's right, he smells too.");
talkEntry:addResponse("Krazen neber be gud warrior...always getting his head stuck in beehives...");
talkEntry:addResponse("Krazen friendly enough, meh fink. Jus' don't make eye contact.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Jaa, Murgo. Er ehrenvoll Krieger. Einfluss gro�, auf Orks. Getahn viele gro�e Taten. Viele.");
talkEntry:addResponse("Yubba, Murgo viel Stolz auf seine T�chta ist. Er'hja 'nd Ol'hja. Stark klugg Weibs sind.");
talkEntry:addResponse(" Murgo mit Krudash ist. Sie sein Weibs sein. Sie Mama von Er'hja 'nd Ol'hja.");
talkEntry:addResponse("Uh, mir glauben Murgo schwer hatt manch mal. Mit drei Weibs! Krudash. 'nd da T�chta Er'hja 'nd Ol'hja. Aba alle drei h�bsche Weibs sind. Yubba.");
talkEntry:addResponse("Murgo beste freund ist Jag.");
talkEntry:addResponse("Mancha Orks witzig, sagen Murgo sein Blumens. Vleicht war. Aber jetzt er stampft zer alle Blumens!");
talkEntry:addResponse("Murrgo - dar Name von grosse Kriega, mit grosse Axt. Aber er nix bester in denken. er Blumenork war. Aber jetzt er zerstampfen all Blumens! Harr, harrrr!");
talkEntry:addResponse("Hurr, Murgo gehohlt mirr. Sagen mirr, kommen nach hirr. Wie meiste andere Orks hirr. Ganze lange Weg von Kroch'gurak!");
talkEntry:addResponse("Murgo, hurr hurr! Er Ork mit mei�te Ehre ist. erster gewesen, der Trommel hatt.");
talkEntry:addResponse("Murgo verdammte Ass ist. Jede orc wolle sein wie er sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, Murgo. He is honorfull warrior. Important for Orcs. Lot of great doings. Lot of.");
talkEntry:addResponse("Hurr, Murgo hired mes. Like most ob tha othas 'ere. All way from Kroch'gurak!");
talkEntry:addResponse("Murgo, hurr hurr! 'eh honrorables Orc is. Was first played drum. Yubba.");
talkEntry:addResponse(" Murgo 's damn ace is! Ebbry orc wanna like he be.");
talkEntry:addResponse("Yubba. Murgo very proud ob 'is doughtas is... Er'hja 'nd Ol'hja. Be stong 'n smart females are.");
talkEntry:addResponse("Murgo be with Krudash. She 'is female. She be mum ob Er'hja 'nd Ol'hja.");
talkEntry:addResponse("Uh, me guess Murgo hab sumtime hard, with 'is three females. Krudash. 'nd tha doughtas Er'hja 'nd Ol'hja. But all three pretty, yubba!");
talkEntry:addResponse("Murgo best friend be Jag.");
talkEntry:addResponse("Sum Orc joke Murgo, be Flower. Maybe was. But nuw 'eh stump all flowas!");
talkEntry:addResponse(" Murrrgo - dis beh name ob great warriar with great axe! But mes think he nub well in thinking. He be flowery flower orc was! Hurr! But nuw he stomps ob flowry! Harr, harrrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erhja");
talkEntry:addTrigger("er'hja");
talkEntry:addTrigger("er hja");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Er'hja gl�cklich sich sch�tzen kann. Hatt sein klugg von Mama. Sein Ass von Papa. Krudash 'nd Murgo sind.");
talkEntry:addResponse("Er'hja gelernt hat bei MO'rurt. Und Jag. Tapfere, mutig M�dchen. Yubba!");
talkEntry:addResponse("Er'hja 'nd Ol'hja Schwesta sind. Yubba, auseehn beinahe wie gleich.");
talkEntry:addResponse("Jede Mann hoffen bekomm Er'hja oda Ol'hja zu Weibs. Sie gutte Weibs sind! Yubba.");
talkEntry:addResponse("#me lacht heiser: 'Ha-hr. Welpen wie Er'hja 'nd Ol'hja machen vieles Sorge f�r Mama 'nd Papa.'");
talkEntry:addResponse("#me lacht heiser: 'Ha-hr. Mirr kenne sie seit sie war winzig kleinig. Mirr konnte halten in eine Hand!'");
talkEntry:addResponse("Lustig geschicht... Er'hjas Papa Murgo z�chtn Hounds. Aba Er'hja f�rchten diese wie Hasal!");
talkEntry:addResponse("Uh, nix mirr frag. Er'hja, sie lieben Rabe! Sagen sie klugg sind. wasimma, mir sagt. Rabn Vogl sind. Vogl dummig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erhja");
talkEntry:addTrigger("er'hja");
talkEntry:addTrigger("er hja");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Er'hja could lucky be. Got tha smart ob 'er mom 'nd ace ob papy. Krudash 'nd Murgo are.");
talkEntry:addResponse("Er'hja was trained by Mo'rurt. And Jag. Brave girl. Yubba!");
talkEntry:addResponse("Er'hja 'nd Ol'hja be Sistahs. Yubba, almost look tha same.");
talkEntry:addResponse("Each Male hope to get Er'hja or Ol'hja as'n female! They good females! Yubba.");
talkEntry:addResponse("#me chukles hoarsely: 'Ha-hr. Whelps like Er'hja 'nd Ol'hja cuase musch trouble for tha mum and papy.'");
talkEntry:addResponse("#me chukles hoarsely: 'Ha-hr. Mes know 'er since she was such puny, mes could hol'er with un hand!");
talkEntry:addResponse("Funny tale... Er'hjas papy Murgo breeds hounds. But she fear those like rabbitz!");
talkEntry:addResponse("Uh, nub ask mes. Er'hja, she love corbie! Mean they smart. Whubebba, mes say. Corbie be bird. Bird stupid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ali[czs]");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Alize, Gnarh. Sie jammernd Kind bei Schmieda. Sie Krudashs Sklave ist. Sie schmelzn Erz, muss.");
talkEntry:addResponse("Du nix sein schwuach mit diesa jammernde Slkave. Sie lernen muss, zu sein STARK! Machen den Besitza Ehre. Yubba.");
talkEntry:addResponse("Har! Krudash gefangen auf eine Harfen. jetzt ALize, Sklave ist. Aber Jammern viel tut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ali[czs]");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Alize, Gnarh. This bis thus weepy girl at forge. She be Krudash slave is. She hav to smelt you ore.");
talkEntry:addResponse("Nub be weak with those weepy slave. She hab to learn, be strong! Bring tha owner honor! Yubba.");
talkEntry:addResponse("Har! Krudash sacked her 'n sum harbour. Now she be her slave is. But weak weepy one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("Hacksack");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Krudash, hurr! Sie klugg. Hat vieles M�nz. hat vieles Sklave. Hat gute Mann. Hat tapfere Tochtas.");
talkEntry:addResponse("Hurr, sie hatt Alize 'nd diese t�kke Halbling als Skalve. Sklaven gutt! Machen viel Ehre.");
talkEntry:addResponse("Sie Weibs von Murgo ist. Hurr. Er glucklich sein kann. Krudash h�bsch 'nd klugg!");
talkEntry:addResponse("Hurr, mirr mag ihre Nase! Sein s��. He-he. Aber nix  sagst Murgo!");
talkEntry:addResponse("Krudash verkauft alle sachn, du brauchst zum raubn 'nd pl�ndarn. Guttgutt. Sie Besitza von  Hack'n Sack Laden.");
talkEntry:addResponse("Fruha, sie gewesen Wache furr Bootschaft. In Trolls'Bane. Wie sie geworden Murgos Weibs, sie erbaut hat Laden. - Hack'n Sack.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("Hacksack");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Krudash, hurr! She be smart. Got many coin. Got many slave. Got good male. Got brave doughters.");
talkEntry:addResponse(" Hurr. She hold Alize 'nd thos dastardly halfer 's slave. Slave good! Bring 'onor!");
talkEntry:addResponse("She be female ob Murgo. Hurr. He could lucky be about that. Krudash pretty 'nd smart is.");
talkEntry:addResponse("Hurr. Me like 'er nose! Is damn cute. He-he. But nub tell Murgo!");
talkEntry:addResponse("Krudash sell all stuff you need to hack'nd sack. Wellwell. She be owner ob tha Hack'n Sack Shop.");
talkEntry:addResponse("Former she was guard at Embassy to Troll's Bane. She became Murgos female 'nd found Shop - Hack'n Sack.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("morurt");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Mo'rurt. Er bester J�ga von KLan ist. erimma drau�n ist. Jagt.");
talkEntry:addResponse("Mo'rurt schie�t Pfeile, schnell wie wind. Stark wie Meer.");
talkEntry:addResponse("Mo'rurt Besitza von Stout ist. Stout sehr ehrenhaftiga Sklave ist. Yubba. Hat bekommen Armbrust und geht jagen mit Mo'rurt.");
talkEntry:addResponse("Har-ar. Mo'rurt stur wie Esel. Abar mirr sagt, is gutt. Alle in alles, er gerechter Meister ist.");
talkEntry:addResponse("Mo'rurt kommen von einsam Land. Wenig gelebt dort. Murgo ihn gefunden hatt als Mo' nach Kroch'gurak gekommen f�r den Winta.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("morurt");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Mo'rurt. Hurr he be best archer of Clan be. He allway out ob cave huntin!");
talkEntry:addResponse("Mo'rurt shoot 'is arrow fast like wind. Strong like Sea.");
talkEntry:addResponse("Mo'rurt be owner ob Stout. Stout be honorable slave is. Yubba. Got crossbow and joins Mo'rurt on hunting.");
talkEntry:addResponse("Har-ar. Mo'rurt is mulish. But 'e say he's just right. But all'nall he fair master is.");
talkEntry:addResponse("Mo'rurt come frome sum lonly lands. Nub much lived there. Was picked up by Murgo, wehn he walked to Kroch'gurak for winta.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olokwa");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me zischt: 'Du fr�gst den alt, blind Ork?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olokwa");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me hisses: 'Youbba ask tha old orc?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sogg");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Sogg Beermug! Guttgutt. Er ass ork ist. Imma geben aus, runde von Booze. Imma gibt Bier zu tapfere Kriegas.");
talkEntry:addResponse("#me lacht: 'Sogg, F�ssaw�chta is. Aba mei�te Zeit er saufn alles bewachte Booze allein aus! Har-har!'");
talkEntry:addResponse("Sogg auch hei�t Beermug. Sogg Beermug! Du ratest, warum...");
talkEntry:addResponse("Mirr geh�rt Murgo gefundn Sogg in eine dreckig Taverne. Abgef�llt mit Bohnen-Booze. Als er aufgewacht... er unser neue F�ssaw�chta war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sogg");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Sogg Beermug! Wellwell. He be ace orc is. Allway pay a round ob booze. Allway give Bear for brave warrior.");
talkEntry:addResponse("#me laughs: 'Sogg be tha barrel guard. But most ob time he drink tha guarded booze by him own! Har-har!'");
talkEntry:addResponse("Sogg name also be Beermug. Sogg Beermug!  Make a guess, why for...");
talkEntry:addResponse("Mes hered Murgo picked Sogg up, in some scummy tavern, filled up with beans booze. As he waked up... he was us new barrelguard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stout");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Stout Sklave ist von Mo'rurt. Er gutte Sklave. Bringt besitza viele Ehre.");
talkEntry:addResponse("Auch wenn Stout ist OOmie,er allrichtig ist. Er tapfere Sklave. Mo'rurt sehr stolz issigt.");
talkEntry:addResponse("Hurr, Stout stark Sklave ist. Nix wie diese jammernde M�dchen 'nd diese listig Halbling. Stout bekommen Ehre. Die andere Zwei, bekomme Strafe.");
talkEntry:addResponse("Stout gekommn mit Mo'rurt zusamme. Mir denken, er seit lange Zeit Sklave ist.");
talkEntry:addResponse("Mirr sicha sein, Mo'rurt mehr ist, als Meister von Stout. Sucha beide sowas wie Freunde sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stout");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Stout be slave ob Mo'rurt. He good slave. Make tha owner much honor.");
talkEntry:addResponse("Altough he Oomie is, he be allrighty. Stout brave slave. Mo'rurt be proud ob 'hm.");
talkEntry:addResponse("Hurr, Stout strong slave. Nub like thus weepy girl 'nd tha dastardly halfer. Stout 'll earn great honor. Tha otha both earn punsihment.");
talkEntry:addResponse("Stout arrived togetha with Mo'rurt. Me guess Stout be slave since long time.");
talkEntry:addResponse("Me sur Mo'rurt be more to Stout than Masta. Sure both be weird kind ob friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tom");
talkEntry:addTrigger("berry");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Garh! Disa hintalistig Halbling! Thoma' Berryar'! Einmal er vermischt Glasscherbn mit Krudashs fressen.");
talkEntry:addResponse("Garh! Disa hintalistig Halbling! Thoma' Berryar'! Einmal er geflohen durch Berge. Aber unsre Hounds ihn erlegt danieder! Jezt er muss kloppen Steins.");
talkEntry:addResponse("Garh! Disa hintalistig Halbling! Thoma' Berryar'! Du im Auge hast sein kleine F�uste. ergerne haut dirr zwischen Beine!");
talkEntry:addResponse(" Sie gesagt, Thoma' Berryar'. er Grund ist, Murgo 'nd Krudas nix haben mehr Welpen. wassimma das hei�en.");
talkEntry:addResponse("Murgo geschnappt diese Halbling irgendwohig nahe von Briar Dorf. SCheint es nix erstemal, f�r Thoma' war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tom");
talkEntry:addTrigger("berry");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Garh! Thus dastardly halfer! Thoma' Berryar'! Once he tried to mix cullet with Krudash's food.");
talkEntry:addResponse("Garh! Thus dastardly halfer! Thoma' Berryar'! Once he tried to escape tha mountains. But us hounds hunt 'hm down. Now 'e hab to batter stones.");
talkEntry:addResponse("Garh! Thus dastardly halfer! Thoma' Berryar'! Watch 'hs tiny fists. He like to smash you beetween legs.");
talkEntry:addResponse("They say, Thoma' Berryar'. He be reason, Murgo'n Krudash nub got more whelps. Whubabba thut mean.");
talkEntry:addResponse("Murgo sacked thus Halfer sumwhere close tha Briar hamlet. Seems it wasn't tha first time for Thoma' Berryar'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("thud");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr hurr. Thud sammeln Troph�e. Auch wenn er ist nix kl�gsta, er gutte Ork!");
talkEntry:addResponse("Thud genannt Thud. *lacht kichernd* Weil er mag verkloppen Leutz.");
talkEntry:addResponse("Hurr, Thud dumm wie Dreck ist. Aber wer braucht Denkmuskel, wenn hatt  rie�ig Muskels sowieso? Hu!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("thud");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr hurr. Thud collect trophy. Altough some clumsy. He good Orc.");
talkEntry:addResponse("Thud, is named Thud. *chukles* Cause 'e like to thud people.");
talkEntry:addResponse("Hurr. Thud be dump like mudd. Bud who need brainmuscle, ib you hab huge muscle anyway? Hu!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("brute");
talkEntry:addTrigger("boze");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Brute Booze! Ist name von mei�t ber�hmte Orkabenteura! er gro��e REisenda. J�ga von viels schrecklich Bestien!");
talkEntry:addResponse("Brute Booze, gesoffen Booze in jeda taverne von Illarion, er versprechen! Her erschlagen gigantisch Schlange von Gynk zwei malig. Un' genommen Prinzess von Khensarra zu Weibs!");
talkEntry:addResponse("'llgutt. Brute sein eine von alte Helden. Mit Respekt furr Tradition. Und dramatische Geschichte.");
talkEntry:addResponse("Uh, mirr w�nschen mirr k�nnte sein wie Brute Booze. Wenn mir wollen h�ren Geschicht von fremde Land, mir fr�gt Brute.");
talkEntry:addResponse("Sie gesagt, Brute Booze wissen viels �ber fremde L�nda. Sicha er gezogen durch alle von ihnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("brute");
talkEntry:addTrigger("boze");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Bute Booze! Is name ob most famous orc adventurer! He big Travela. Hunta ob several cruel biests!");
talkEntry:addResponse("Brute Booze, drunk Booze in each tavern ob Illarion, he promise! He slay tha giant Snake ob Gynk twice. An' took tha princess ob Khensarra as female!");
talkEntry:addResponse(" 'llrigthy. Brute 's one ob old heros. With feeling for tradition. An' dramatic ob tale!");
talkEntry:addResponse("Uh, I wish I cuold be like Brute Booze. Ib mes wanna 'ere tale ob strange land, mes allways ask 'hm.");
talkEntry:addResponse("They say Brute Booze know lot about strange lands. Surely he traveled trough all ob them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("grimlug");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("grumlug sein Schamane ist. Wissen viel �ba G�tta. Viel �ba Ritus.");
talkEntry:addResponse("Murgo getrofffen Grimlug, in Kroch#gruak. ist gutt, er jetzt hier ist.");
talkEntry:addResponse("Grimlug erz�hlen lange. Reden Viel. Wei� viel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("grimlug");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Grimlug be Shaman is. Know many bout gods. Many bout rite.");
talkEntry:addResponse("Hurr. Murgo picked thus shaman up sumwhere 'n Kroch'gurak. Is good 'e here now.");
talkEntry:addResponse("Grimlug talk much. Long tale. Know much.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nork");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Nork Soldat ist. Von Ogretoe. er bek�mmern G�ta und Versorgung dort.");
talkEntry:addResponse("Uh, d' Kriega von Lager Ogretoe wirklich sind tapfer! Mirr geh�rt, Oger ist m�chtig Gegner.");
talkEntry:addResponse("Uh, Ist Nork diese h�ssliche Ork, in Lager von Ogerland?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nork");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nork be soldier ob Ogretoe. He take care ob Supply there.");
talkEntry:addResponse("Uh, tha soldiers at Camp Ogretoe such brave! Mes 'ered tha Ogres be stong enemie.");
talkEntry:addResponse("Uh, is Nork thus ugly one, at tha ogreland-camp?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("vigo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Captain Viggo! Mir so viel gl�ck, er und tapfere kriega, besch�tze unser Erz von verdammte Ogers.");
talkEntry:addResponse("Captain Viggo ist Kommandierer von Lager Ogretoe. er imma braucht Kriega!");
talkEntry:addResponse("Hurr. Ohne Viggo und 's Kriega, wirr nix w�rde bekommen Erz. Mir froh, Murgo gefunden ihn hatt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("vigo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Captain Viggo! Mes such glad, he 'nd s brave soldiers defend us ore from tha damn Ogres.");
talkEntry:addResponse("Captain Viggo is commanda ob Camp Ogretoe. He allway hire soldiers!");
talkEntry:addResponse("Hurr. Without Viggo 'nd his soldiers wes wouldn't abe to get ore. Mes glad Murgo pick'ed' hm up.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("budva");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr. Budvar Buddler ist. er graben nach Erz. In Lager, Ogretoe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("budva");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Budvar be digger is. He digg for ore at tha Ogretoe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olhja");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ol'hja ist Tochta von Murgo. Sie Kundschafta in laga von Ogretoe. Hurr Hurr.");
talkEntry:addResponse("Ol'hja ist eine von beste Kundschafta von Captain Viggos Kriegas.");
talkEntry:addResponse("Er'hja 'nd Ol'hja Schwestas sind. Yubba, sie gleich aussehen. Nahezu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olhja");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ol'hja's tha doughta ob Murgo. She be scout in tha ogretoe-camp. Hurr Hurr.");
talkEntry:addResponse("Ol'hja s one ob most skilled scouts under Captain viggos soldiers.");
talkEntry:addResponse("Er'hja 'nd Ol'hja be Sistahs. Yubba, almost look tha same.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yago");
talkEntry:addTrigger("helgi");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr. Yago 'nd Helgi sind tapfere Kriega! Yubba.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yago");
talkEntry:addTrigger("helgi");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr. Yago 'nd Helgi be brave soldier. Yubba.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("moshran");
talkEntry:addTrigger("god");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Gosh! NIcht sagst diese Name! Bassa fragen Schamane �ber Vatha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("moshran");
talkEntry:addTrigger("god");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gosh! Nub say tha name! Bettu talk to Shaman about tha fatha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where com");
talkEntry:addTrigger("krochgurak");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Kroch'gruak! Ist, wo mei�e Orks von uns komme her von.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where com");
talkEntry:addTrigger("krochgurak");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Kroch'gurak! Is where most ob us orcs come from.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ogetoe");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr. Captain Viggo, 'nd seine Kriega k�mpfn dort furr unsa Erz!");
talkEntry:addResponse("Hurr, ist Ort wo Erz ist. Aba alles voll mit w�tende Ogers ist. Du gehst mit Kriega nur dorthin.");
talkEntry:addResponse("Ogretoe sein Lager von Captain Viggo. Er besch�tzt Miene gegen Oger!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ogetoe");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr. Captain Viggo, 'nd his soldiers fight there for our ore!");
talkEntry:addResponse("Hurr. Is Place where ore was found. But full ob angry ogre is. Take warrior with youb, to walk there.");
talkEntry:addResponse("Ogretoe be tha camp ob Captain Viggo. It defend ore mine agins ogres!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me klimpert mit der erloschenen Laterne in seinen H�nden.", "#me jingles with his empty lantern.");
talkingNPC:addCycleText("#me schiebt seine Augenbinde zurecht.", "#me adjusts his blindfold.");
talkingNPC:addCycleText("Olokwa h�rt die Stimmen der Ahnen! Er befragt die Knochen! Er sieht die eisige Hexe in seinen Tr�umen.", "Olokwa hear tha voice of ancestors. He quizes the bones. He see tha icy witch in his dreams! ");
talkingNPC:addCycleText("Ich sehe tote Orks!", "I see dead Orcs!");
talkingNPC:addCycleText("#me nuckelt, breit grinsend an einer Wurst.", "#me slurps with a broad grin a sausage.");
talkingNPC:addCycleText("Die eisige Hexe! Sie nennt alles beim wahren Namen! Nennt sie.", "The icy witch! She call ebberything by the true nam! She do.");
talkingNPC:addCycleText("Dieh Ahnen ruhen nicht! Nein...", "The ancestors are fitful. Yes...");
talkingNPC:addCycleText("Stein brechen wird. Holz morschen wird. Knochn splittern wird.", "Stone 'll break. Wood'll root. Bone 'll slpash.");
talkingNPC:addCycleText("#me bohrt einen Finger ins Ohr.", "#me drills a finger into his ear.");
talkingNPC:addCycleText("#me steckt sich einen finger nach den anderen in den Mund und lutscht den Dreck unter den Fingern�geln aus.", "#me slurps at one finger after another, to get the dirt under the fingernails.");
talkingNPC:addCycleText("#me nimmt einen Schluck aus einer kleinen schmuddeligen Flasche. Scharfer alkoholischer Dunst steigt in die Luft.", "#me takes a gulp from a grubby little bottle. A strong stench of alcohol fills the air.");
talkingNPC:addCycleText("#me schwankt pl�tzlich f�r einige Sekunden beunruhigend ohne ein Wort von sich zu geben. Dann schnarcht er mit einem Mal laut auf und erwacht daraufhin wieder mit verwirrtem Gesichtsausdruck.", "#me swings some seconds ominously at his stand without a noise, then gives a loud snore and wake up again, grimazing a puzzled face.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein uralter knochend�rrer Ork. Ein schmutziger Lumpen verbindet seine Augen, er scheint blind zu sein. Er h�lt eine erloschene Laterne in der Hand.", "An immemorial bony Orc. A scruffy rag is bound over his eyes, he seems to be blind. He holds a empty lantern in his hand.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(texttype, message, speaker) mainNPC:receiveText(speaker, message); end;
function nextCycle() mainNPC:nextCycle(); end;
function lookAtNpc(char, mode) mainNPC:lookAt(char, mode); end;
function useNPC(char, counter, param) mainNPC:use(char); end;
initNpc();
initNpc = nil;
-- END