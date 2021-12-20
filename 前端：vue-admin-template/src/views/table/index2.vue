<template>
  <div class="app-container">
    <el-table
      :data="tableData"
      style="width: 100%">
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
import { add,get,update } from '@/api/emp'

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
    addData(emp) {
      add(emp).then(response => {
        this.$message({
              type: 'success',
              message: '增加成功!'
            });
        // 跳转到列表页
        this.$router.push({path:"/table/index"})
    })
    },
    getData(id) {
      get(id).then(response => {
        this.emp = response.data.emp
        })
    },
    updateData(emp) {
      update(emp).then(response => {
        this.$message({
              type: 'success',
              message: '增加成功!'
            });
        // 跳转到列表页
        this.$router.push({path:"/table/index"})
      })
    }
  }
}
</script>
