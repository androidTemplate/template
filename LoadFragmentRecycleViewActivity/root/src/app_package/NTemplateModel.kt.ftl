package ${escapeKotlinIdentifiers(packageName)}
class N${className}ModelReq(
    var pageSize: Int = 20,
    var pageIndex: Int = 1
)

class N${className}ModelResponse(
    val code: Int = -1,
    val message: String = "",
    val data: Data = Data()
) {
    class Data(
        val totalCount: Int = 0,
        val mList: List<${className}Item> = listOf()
    )
}
class ${className}Item