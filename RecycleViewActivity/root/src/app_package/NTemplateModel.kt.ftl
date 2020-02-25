package ${escapeKotlinIdentifiers(packageName)}
class N${className}ModelReq(
    var pageSize: Int = 20,
    var pageIndex: Int = 1
)

class N${className}ModelResponse(
    val code: Int = -1,
    val msg: String = "",
    val data: Data = Data()
) {
    class Data(
        val mList: List<${className}Item> = listOf()
    )
}
class ${className}Item