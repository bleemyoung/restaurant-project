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
import { getEmps } from '@/api/user'
import { delEmps } from '@/api/emp'

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
    },
    delData(id) {
      this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
          // 如果点击了确定则调用then
        }).then(() => {
          delEmps(id).then(response =>{
            this.fetchData()
        this.$message({
              type: 'success',
              message: '删除成功!'
            });
          })
        })
    },
    handleEdit(id){
      this.$router.push("/table/index2/"+id)
    }
  }
}
</script>
