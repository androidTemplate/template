package ${escapeKotlinIdentifiers(packageName)}

import com.xhs.baselibrary.base.IBaseView
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>
interface ${className}Contact {

    interface I${className}View:IBaseView{

        fun load${className}Success(mList:List<${className}Item>, totalCount:Int)

        fun  load${className}Fail(throwable: Throwable)

    }

    interface I${className}Presenter{
        fun load${className}(n${className}ModelReq: N${className}ModelReq)
    }
}