
RuleSet: Question(linkId, text, type, repeats)
* item[+].linkId = "{linkId}"
* item[=].text = "{text}"
* item[=].type = #{type}
* item[=].repeats = {repeats}


Instance: hiv-questionnaire
InstanceOf: sdc-questionnaire-extr-smap
Description: "Case Report Questionnaire"
Title: "Case Report Questionnaire"
Usage: #definition
* title = "HIV Case Report Questionnaire"
* description = "HIV Case Report Questionnaire"
* name = "HIVCaseReportQuestionnaire"
* version = "2023"
* status = #draft
* subjectType = #Patient
* language = #en
* status = #draft

// Then insert the questions:
* insert Question(general,General questions,group,false)
// To insert lower questions, be aware that for now, you need to set the context to the current item:
* item[=]
// and then add the question:
  * insert Question(anythingToAdd,Anything to report?,boolean,false)

// The question is currently populated with the key aspects - id, name, type and repeats.
// to set other attributes, just add them to the current item
  * item[=].required = true

// To add a valueset, for example:
//* item[=].answerValueSet = Canonical(vs-hiv-mediatorsys)
* item[=]

  * insert Question(describe,Please describe,group,false)
  * item[=]
    * enableWhen
      * question = "anythingToAdd"
      * operator = #=
      * answerBoolean = true
    * insert Question(mentally,Mentally?,string,false)
    * insert Question(physically,Physically?,string,false)
