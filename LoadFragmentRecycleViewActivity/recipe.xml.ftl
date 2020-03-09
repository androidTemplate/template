<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
   

    <instantiate from="root/res/layout/fragment_template.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />


<instantiate from="root/res/layout/item_template_layout.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutName}.xml" />

    <@kt.addAllKotlinDependencies />
    <instantiate from="root/src/app_package/TemplateFragment.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${fragmentName}.${ktOrJavaExt}" />

    <instantiate from="root/src/app_package/NTemplateModel.${ktOrJavaExt}.ftl"
                       to="${escapeXmlAttribute(srcOut)}/N${className}Model.${ktOrJavaExt}" />

    <instantiate from="root/src/app_package/TemplateAdapter.${ktOrJavaExt}.ftl"
                       to="${escapeXmlAttribute(srcOut)}/${className}Adapter.${ktOrJavaExt}"/>

    <instantiate from="root/src/app_package/TemplateContact.${ktOrJavaExt}.ftl"
                       to="${escapeXmlAttribute(srcOut)}/${className}Contact.${ktOrJavaExt}"/>


    <instantiate from="root/src/app_package/TemplatePresenter.${ktOrJavaExt}.ftl"
                       to="${escapeXmlAttribute(srcOut)}/${className}Presenter.${ktOrJavaExt}"/>
    <open file="${escapeXmlAttribute(srcOut)}/${fragmentName}.${ktOrJavaExt}" />
</recipe>
