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
    </el-table>
  </div>
</template>

<script>
import { getDishes } from '@/api/dishes'

export default {
  filters: {
    statusFilter(status) {AV
      const statusMap = {
        published: 'success',
        draft: 'gray',
        deleted: 'danger'
      }
      return statusMap[status]
    }
  },
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
    }
  }
}
</script>
