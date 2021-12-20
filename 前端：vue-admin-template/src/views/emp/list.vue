<template>
  <div class="app-container">
    <el-table
      :data="tableData"
      style="width: 100%">
      <el-table-column
        prop="empno"
        label="序号"
        width="180">
      </el-table-column>
      <el-table-column
        prop="ename"
        label="姓名"
        width="180">
      </el-table-column>
      <el-table-column
        prop="job"
        label="工作"
        width="180">
      </el-table-column>
      <el-table-column
        prop="sal"
        label="工资">
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { getEmps } from '@/api/user'

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
      getEmps().then(response => {
        this.tableData = response.data.items
      })
    }
  }
}
</script>
