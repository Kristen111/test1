package com.aistar.service.impl;

import com.aistar.dao.NoteDao;
import com.aistar.entity.Note;
import com.aistar.service.NoteService;
import com.aistar.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

public class NoteServiceImpl implements NoteService {
    @Override
    public boolean save(Note note) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        NoteDao dao = sqlSession.getMapper(NoteDao.class);
        int rows = dao.insert(note);
        sqlSession.commit();
        MyBatisUtil.closeSqlSession();
        return rows>0;
    }
}
