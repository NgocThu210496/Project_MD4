package com.ra.repository;

import com.ra.model.Account;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface AccountRepository extends JpaRepository <Account,Integer> {
    @Query("select a from Account a where a.email like %?1%")
    Page<Account> findByEmail(String email, Pageable pageable);

    @Query("select a from Account a where a.status = false")
    List<Account> findAccountByStatusFalse();

    @Query("select a from Account a where a.status = true")
    List<Account> findAccountByStatusTrue();

    int countByEmailContains(String email);

    @Query("select a from Account a where a.email like ?1 and a.permission like 'admin'")
    Account checkEmail(String email);

    @Query("select a from Account a where a.password like ?1")
    Account checkPassword(String password);

    @Query("update Account as a set a.status = true where a.accountId = ?1 ")
    void openAccount(int accountId);

    @Query("update Account as a set a.status = false where a.accountId = ?1 ")
    void blockAccount(int accountId);
    @PersistenceContext
    EntityManager entityManager = null;

    @Transactional
    default boolean updateAccountStatus(int accountId) {
        int updatedRows = entityManager.createNativeQuery("UPDATE Account SET status = true WHERE accountId = :accountId")
                .setParameter("accountId", accountId)
                .executeUpdate();

        return updatedRows > 0;
    }
}
