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

    <merge from="root/AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <merge from="root/res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

    <instantiate from="root/res/layout/activity_template.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />


<instantiate from="root/res/layout/item_template_layout.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutName}.xml" />

    <@kt.addAllKotlinDependencies />
    <instantiate from="root/src/app_package/TemplateActivity.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityName}.${ktOrJavaExt}" />

    <instantiate from="root/src/app_package/NTemplateModel.${ktOrJavaExt}.ftl"
                       to="${escapeXmlAttribute(srcOut)}/N${className}Model.${ktOrJavaExt}" />

    <instantiate from="root/src/app_package/TemplateAdapter.${ktOrJavaExt}.ftl"
                       to="${escapeXmlAttribute(srcOut)}/${className}Adapter.${ktOrJavaExt}"/>

    <instantiate from="root/src/app_package/TemplateContact.${ktOrJavaExt}.ftl"
                       to="${escapeXmlAttribute(srcOut)}/${className}Contact.${ktOrJavaExt}"/>


    <instantiate from="root/src/app_package/TemplatePresenter.${ktOrJavaExt}.ftl"
                       to="${escapeXmlAttribute(srcOut)}/${className}Presenter.${ktOrJavaExt}"/>
    <open file="${escapeXmlAttribute(srcOut)}/${activityName}.${ktOrJavaExt}" />
</recipe>
