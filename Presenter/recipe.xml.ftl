<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
   
    <@kt.addAllKotlinDependencies />

    <instantiate from="root/src/app_package/NTemplateModel.${ktOrJavaExt}.ftl"
                       to="${escapeXmlAttribute(srcOut)}/N${className}Model.${ktOrJavaExt}" />

    <instantiate from="root/src/app_package/TemplateContact.${ktOrJavaExt}.ftl"
                       to="${escapeXmlAttribute(srcOut)}/${className}Contact.${ktOrJavaExt}"/>


    <instantiate from="root/src/app_package/TemplatePresenter.${ktOrJavaExt}.ftl"
                       to="${escapeXmlAttribute(srcOut)}/${className}Presenter.${ktOrJavaExt}"/>
    <open file="${escapeXmlAttribute(srcOut)}/${activityName}.${ktOrJavaExt}" />
</recipe>
