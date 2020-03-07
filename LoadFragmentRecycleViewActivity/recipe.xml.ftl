<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
   <dependency mavenUrl="com.android.support:appcompat-v7:${buildApi}.+" />

    <#if buildApi gte 22>
        <dependency mavenUrl="com.android.support:design:${buildApi}.+" />
    </#if>

    <#if (includePermissionCheck!false)>
        <dependency mavenUrl="com.android.support:support-annotations:${buildApi}.+" />
    </#if>

    <dependency mavenUrl="com.android.support.constraint:constraint-layout:+" />
    <dependency mavenUrl="android.arch.lifecycle:extensions:+"/>

    <#include "../common/recipe_theme.xml.ftl" />
    <#include "../common/recipe_manifest_strings.xml.ftl" />

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
