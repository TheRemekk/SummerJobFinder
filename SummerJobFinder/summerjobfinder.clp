;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule NeedMakeMoneyDQ ""

   (logical (start))

   =>

   (assert (UI-state (display QNeedMakeMoney)
                     (relation-asserted NeedMakeMoney)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule MoneyToSpendDQ ""

   (logical (NeedMakeMoney No))

   =>

   (assert (UI-state (display QMoneyToSpend)
                     (relation-asserted MoneyToSpend)
                     (response No)
                     (valid-answers No Yes))))

(defrule ArtisticTalentDQ ""

   (logical (MoneyToSpend No))

   =>

   (assert (UI-state (display QArtisticTalent)
                     (relation-asserted ArtisticTalent)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule StayInHamiltonDQ ""

   (logical (MoneyToSpend Yes))

   =>

   (assert (UI-state (display QStayInHamilton)
                     (relation-asserted StayInHamilton)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule UseYourBrainDQ ""

   (logical (StayInHamilton Yes))

   =>

   (assert (UI-state (display QUseYourBrain)
                     (relation-asserted UseYourBrain)
                     (response No)
                     (valid-answers No Yes))))

(defrule WantUseYourBrainDQ ""

   (logical (NeedMakeMoney Yes))

   =>

   (assert (UI-state (display QWantUseYourBrain)
                     (relation-asserted WantUseYourBrain)
                     (response No)
                     (valid-answers No Yes))))

(defrule WantToWorkOutsideDQ ""

   (logical (WantUseYourBrain No))

   =>

   (assert (UI-state (display QWantToWorkOutside)
                     (relation-asserted WantToWorkOutside)
                     (response No)
                     (valid-answers No Yes))))

(defrule HardPhysicalLabourDQ ""

   (logical (WantToWorkOutside Yes))

   =>

   (assert (UI-state (display QHardPhysicalLabour)
                     (relation-asserted HardPhysicalLabour)
                     (response No)
                     (valid-answers No Yes))))

(defrule CampingDQ ""
  
   (logical (HardPhysicalLabour No))

   =>
   
   (assert (UI-state (display QCamping)
                     (relation-asserted Camping)
                     (response No)
                     (valid-answers No Yes))))

(defrule ShoweringInfrequentlyDQ ""

   (logical (HardPhysicalLabour Yes))

   =>

   (assert (UI-state (display QShoweringInfrequently)
                     (relation-asserted ShoweringInfrequently)
                     (response No)
                     (valid-answers No Yes))))

(defrule AnimalsDQ ""
   
   (logical (ShoweringInfrequently No))

   =>

   (assert (UI-state (display QAnimals)
                     (relation-asserted Animals)
                     (response No)
                     (valid-answers No Yes))))

(defrule WantToWorkWithFoodDrinkDQ ""
   
   (logical (WantToWorkOutside No))

   =>

   (assert (UI-state (display QWantToWorkWithFoodDrink)
                     (relation-asserted WantToWorkWithFoodDrink)
                     (response No)
                     (valid-answers No Yes))))

(defrule TellingPeopleWhatToDoDQ ""
   
   (logical (WantToWorkWithFoodDrink No))

   =>

   (assert (UI-state (display QTellingPeopleWhatToDo)
                     (relation-asserted TellingPeopleWhatToDo)
                     (response No)
                     (valid-answers No Yes))))

(defrule FineWithTravellingDQ ""
   
   (logical (TellingPeopleWhatToDo No))

   =>

   (assert (UI-state (display QFineWithTravelling)
                     (relation-asserted FineWithTravelling)
                     (response No)
                     (valid-answers No Yes))))

(defrule AfraidOfNeedlesDQ ""
   
   (logical (FineWithTravelling No))

   =>

   (assert (UI-state (display QAfraidOfNeedles)
                     (relation-asserted AfraidOfNeedles)
                     (response No)
                     (valid-answers No Yes))))

(defrule BulkyDQ ""
   
   (logical (TellingPeopleWhatToDo Yes))

   =>

   (assert (UI-state (display QBulky)
                     (relation-asserted Bulky)
                     (response No)
                     (valid-answers No Yes))))

(defrule GoodSwimmerDQ ""
   
   (logical (Bulky No))

   =>

   (assert (UI-state (display QGoodSwimmer)
                     (relation-asserted GoodSwimmer)
                     (response No)
                     (valid-answers No Yes))))

(defrule GoodPeopleSkillsDQ ""
   
   (logical (WantToWorkWithFoodDrink Yes))

   =>

   (assert (UI-state (display QGoodPeopleSkills)
                     (relation-asserted GoodPeopleSkills)
                     (response No)
                     (valid-answers No Yes))))

(defrule GettingABitGreasyDQ ""
   
   (logical (GoodPeopleSkills No))

   =>

   (assert (UI-state (display QGettingABitGreasy)
                     (relation-asserted GettingABitGreasy)
                     (response No)
                     (valid-answers No Yes))))

(defrule LikeBurgersDQ ""
   
   (logical (GettingABitGreasy No))

   =>

   (assert (UI-state (display QLikeBurgers)
                     (relation-asserted LikeBurgers)
                     (response No)
                     (valid-answers No Yes))))

(defrule DifferenceBetweenManhattanDQ ""
   
   (logical (GoodPeopleSkills Yes))

   =>

   (assert (UI-state (display QDifferenceBetweenManhattan)
                     (relation-asserted DifferenceBetweenManhattan)
                     (response No)
                     (valid-answers No Yes))))

(defrule WorkInAnOfficeDQ ""

   (logical (WantUseYourBrain Yes))

   =>

   (assert (UI-state (display QWorkInAnOffice)
                     (relation-asserted WorkInAnOffice)
                     (response No)
                     (valid-answers No Yes))))

(defrule BeYourOwnBossDQ ""

   (logical (WorkInAnOffice No))

   =>

   (assert (UI-state (display QBeYourOwnBoss)
                     (relation-asserted BeYourOwnBoss)
                     (response No)
                     (valid-answers No Yes))))

(defrule WorkOutsideDQ ""

   (logical (BeYourOwnBoss No))

   =>

   (assert (UI-state (display QWantToWorkOutside)
                     (relation-asserted WorkOutside)
                     (response No)
                     (valid-answers No Yes))))

(defrule GoodAtAcademicsDQ ""

   (logical (BeYourOwnBoss Yes))

   =>

   (assert (UI-state (display QGoodAtAcademics)
                     (relation-asserted GoodAtAcademics)
                     (response No)
                     (valid-answers No Yes))))

(defrule AreYouArtisticDQ ""

   (logical (GoodAtAcademics No))

   =>

   (assert (UI-state (display QAreYouArtistic)
                     (relation-asserted AreYouArtistic)
                     (response No)
                     (valid-answers No Yes))))

(defrule GoodAtTeachingDQ ""

   (logical (GoodAtAcademics Yes))

   =>

   (assert (UI-state (display QGoodAtTeaching)
                     (relation-asserted GoodAtTeaching)
                     (response No)
                     (valid-answers No Yes))))

(defrule WorkAtMcmasterDQ ""

   (logical (WorkInAnOffice Yes))

   =>

   (assert (UI-state (display QWorkAtMcmaster)
                     (relation-asserted WorkAtMcmaster)
                     (response No)
                     (valid-answers No Yes))))

(defrule DecentWithComputersDQ ""

   (logical (WorkAtMcmaster No))

   =>

   (assert (UI-state (display QDecentWithComputers)
                     (relation-asserted DecentWithComputers)
                     (response No)
                     (valid-answers No Yes))))

(defrule GoodAtCodingDQ ""

   (logical (DecentWithComputers Yes))

   =>

   (assert (UI-state (display QGoodAtCoding)
                     (relation-asserted GoodAtCoding)
                     (response No)
                     (valid-answers No Yes))))

(defrule GoodAtScienceDQ ""

   (logical (WorkAtMcmaster Yes))

   =>

   (assert (UI-state (display QGoodAtScience)
                     (relation-asserted GoodAtScience)
                     (response No)
                     (valid-answers No Yes))))

;;;****************
;;;* REPAIR RULES *
;;;****************

(defrule InternApprenticeEA ""

   (logical (ArtisticTalent No))
   
   =>

   (assert (UI-state (display AInternApprentice)
                     (state final))))

(defrule PerformerMusicianEA ""

   (logical (ArtisticTalent Yes))
   
   =>

   (assert (UI-state (display APerformerMusician)
                     (state final))))

(defrule WorldTravellerEA ""

   (logical (StayInHamilton No))
   
   =>

   (assert (UI-state (display AWorldTraveller)
                     (state final))))

(defrule CouchPotatoEA ""

   (logical (UseYourBrain No))

   =>

   (assert (UI-state (display ACouchPotato)
                     (state final))))

(defrule SummerStudentEA ""

   (logical (UseYourBrain Yes))

   =>

   (assert (UI-state (display ASummerStudent)
                     (state final))))

(defrule ProvincialParkEmployeeEA ""

   (logical (Camping Yes))

   =>

   (assert (UI-state (display AProvincialParkEmployee)
                     (state final))))
   
(defrule FruitPickerEA ""

   (logical (Camping No))
   
   =>

   (assert (UI-state (display AFruitPicker)
                     (state final))))
   
(defrule FarmLabournerEA ""

   (logical (Animals Yes))

   =>

   (assert (UI-state (display AFarmLabourner)
                     (state final))))
                     
(defrule LandscaperEA ""
   
   (logical (Animals No))
   
   =>

   (assert (UI-state (display ALandscaper)
                     (state final))))

(defrule TreePlanterEA ""

   (logical (ShoweringInfrequently Yes))
   
   =>

   (assert (UI-state (display ATreePlanter)
                     (state final))))
                     
(defrule SalesClerkEA ""

   (logical (AfraidOfNeedles Yes))
      
   =>

   (assert (UI-state (display ASalesClerk)
                     (state final))))

(defrule MedicalSubjectEA ""

   (logical (AfraidOfNeedles No))
      
   =>

   (assert (UI-state (display AMedicalSubject)
                     (state final))))

(defrule BrandPromoterEA ""

   (logical (FineWithTravelling Yes))
      
   =>

   (assert (UI-state (display ABrandPromoter)
                     (state final))))

(defrule SportRefereeEA ""

   (logical (GoodSwimmer No))
      
   =>

   (assert (UI-state (display ASportReferee)
                     (state final))))

(defrule LifeguardEA ""

   (logical (GoodSwimmer Yes))
      
   =>

   (assert (UI-state (display ALifeguard)
                     (state final))))

(defrule SecurityGuardEA ""

   (logical (Bulky Yes))
      
   =>

   (assert (UI-state (display ASecurityGuard)
                     (state final))))

(defrule GroceryStoreEmployeeEA ""

   (logical (GettingABitGreasy Yes))
      
   =>

   (assert (UI-state (display AGroceryStoreEmployee)
                     (state final))))

(defrule PrepCookEA ""

   (logical (LikeBurgers No))
      
   =>

   (assert (UI-state (display APrepCook)
                     (state final))))

(defrule FastFoodRestaurantEmployeeEA ""

   (logical (LikeBurgers Yes))
      
   =>

   (assert (UI-state (display AFastFoodRestaurantEmployee)
                     (state final))))

(defrule BarristaEA ""

   (logical (DifferenceBetweenManhattan No))
      
   =>

   (assert (UI-state (display ABarrista)
                     (state final))))

(defrule BartenderEA ""

   (logical (DifferenceBetweenManhattan Yes))
      
   =>

   (assert (UI-state (display ABartender)
                     (state final))))

(defrule MuseumInterpreterEA ""

   (logical (WorkOutside No))
      
   =>

   (assert (UI-state (display AMuseumInterpreter)
                     (state final))))

(defrule SummerCampLeaderEA ""

   (logical (WorkOutside Yes))
      
   =>

   (assert (UI-state (display ASummerCampLeader)
                     (state final))))

(defrule SmallBusinessOwnerEA ""

   (logical (AreYouArtistic No))
      
   =>

   (assert (UI-state (display ASmallBusinessOwner)
                     (state final))))

(defrule PerformerEA ""

   (logical (AreYouArtistic Yes))
      
   =>

   (assert (UI-state (display APerformer)
                     (state final))))

(defrule UsraRecipientEA ""

   (logical (GoodAtTeaching No))
      
   =>

   (assert (UI-state (display AUsraRecipient)
                     (state final))))

(defrule TutorEA ""

   (logical (GoodAtTeaching Yes))
      
   =>

   (assert (UI-state (display ATutor)
                     (state final))))

(defrule CivilServantEA ""

   (logical (DecentWithComputers No))
      
   =>

   (assert (UI-state (display ACivilServant)
                     (state final))))

(defrule AdminAssistantEA ""

   (logical (GoodAtCoding No))
      
   =>

   (assert (UI-state (display AAdminAssistant)
                     (state final))))

(defrule SoftwareDeveloperEA ""

   (logical (GoodAtCoding Yes))
      
   =>

   (assert (UI-state (display ASoftwareDeveloper)
                     (state final))))

(defrule McmasterOfficeAssistantEA ""

   (logical (GoodAtScience No))
      
   =>

   (assert (UI-state (display AMcmasterOfficeAssistant)
                     (state final))))

(defrule McmasterResearchAssistantEA ""

   (logical (GoodAtScience Yes))
      
   =>

   (assert (UI-state (display AMcmasterResearchAssistant)
                     (state final))))
                     
                     
;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   