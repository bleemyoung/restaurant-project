<template>
  <div class="app-container">
    <el-table
      :data="tableData"
      style="width: 100%">
      <el-table-column
        prop="id"
        label="菜品序号"
        width="180">
      </el-table-column>
      <el-table-column
        prop="name"
        label="菜品名称"
        width="180">
      </el-table-column>
      <el-table-column
        prop="price"
        label="菜品价格"
        width="180">
      </el-table-column>
      <el-table-column
        prop="information"
        label="菜品信息">
      </el-table-column>
      <el-table-column
        prop="number"
        label="菜品数量"
        width="180">
      </el-table-column>
      <el-table-column
        prop="isfinished"
        label="菜品是否完成">
      </el-table-column>
      <el-table-column label="操作">
      <template slot-scope="scope">
        <el-button
          size="mini"
          @click="handleCook(scope.row.id)">烹饪</el-button>
      </template>
    </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { getDishes,cook } from '@/api/dishes'

export default {
    data() {
       return {
          tableData: []
        }
    },
    created() {
       this.fetchData()
    },
    methods: {
    fetchData() {
      getDishes().then(response => {
        this.tableData = response.data.items
      })
    },
    handleCook(id) {
        cook(id).then(response=>{
          // 提示信息
          this.$message({
              type: 'success',
              message: '此菜品完成烹饪!'
            });
            // 跳转到列表页
            this.$router.push({path:"/dishes/list"})
        })
    }
}
}
</script>
