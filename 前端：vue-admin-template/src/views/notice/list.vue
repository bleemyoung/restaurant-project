<template>
  <div class="app-container">
    <el-table
      :data="tableData"
      style="width: 100%">
      <el-table-column
        prop="id"
        label="序号"
        width="180">
      </el-table-column>
      <el-table-column
        prop="content"
        label="内容">
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { getNotices } from '@/api/notice'

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
      getNotices().then(response => {
        this.tableData = response.data.items
      })
    }
  }
}
</script>
